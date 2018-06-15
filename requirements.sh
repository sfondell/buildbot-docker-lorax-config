# Get specs file from github and install all requirements ?

wget -q -O- https://github.com/weldr/lorax/blob/master/lorax.spec | grep -c Requires:

# At the moment, all this does is count how many times the string 'Requires:' appears in the spec file
