FROM fedora:latest

USER root
RUN sudo dnf install python3-devel
RUN wget https://github.com/weldr/lorax/blob/master/lorax.spec
RUN grep ^Requires: lorax.spec | awk '{ print $2 }' | xargs sudo dnf install
USER buildbot