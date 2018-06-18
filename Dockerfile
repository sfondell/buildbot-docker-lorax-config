FROM fedora:latest

USER root
RUN curl -o lorax.spec https://raw.githubusercontent.com/weldr/lorax/master/lorax.spec
RUN dnf -y install texlive-xargs
# RUN grep ^Requires: lorax.spec | awk '{ print $2 }' | xargs sudo dnf -y install
RUN dnf -y install dnf-plugins-core
RUN dnf -y builddep lorax.spec
RUN dnf -y install gcc
RUN python3 -m venv sandbox
RUN source sandbox/bin/activate
RUN pip3 install --upgrade pip
RUN pip3 install buildbot-worker
RUN pip3 install setuptools-trial
RUN useradd buildbot
RUN mkdir -p /worker
RUN chown buildbot /worker
USER buildbot

CMD buildbot-worker create-worker worker localhost example-worker pass; buildbot-worker start worker
