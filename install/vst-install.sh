#!/bin/bash
# Vesta installation wrapper
# http://vestacp.com

#
# Currently Supported Operating Systems:
#
#   RHEL 5, 6, 7
#   CentOS 5, 6, 7, 8
#   Debian 7, 8
#   Ubuntu 12.04 - 18.04
#   Amazon Linux 2017
#

# Am I root?
if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

# Check admin user account
if [ ! -z "$(grep ^admin: /etc/passwd)" ] && [ -z "$1" ]; then
    echo "Error: user admin exists"
    echo
    echo 'Please remove admin user before proceeding.'
    echo 'If you want to do it automatically run installer with -f option:'
    echo "Example: bash $0 --force"
    exit 1
fi

# Check admin group
if [ ! -z "$(grep ^admin: /etc/group)" ] && [ -z "$1" ]; then
    echo "Error: group admin exists"
    echo
    echo 'Please remove admin group before proceeding.'
    echo 'If you want to do it automatically run installer with -f option:'
    echo "Example: bash $0 --force"
    exit 1
fi

# Detect OS
case $(head -n1 /etc/issue | cut -f 1 -d ' ') in
    Debian)     type="debian" ;;
    Ubuntu)     type="ubuntu" ;;
    Amazon)     type="amazon" ;;
    *)          type="rhel" ;;
esac

# Check wget
if [ -e '/usr/bin/wget' ]; then

 #   wget http://vestacp.com/pub/vst-install-$type.sh -O vst-install-$type.sh
 wget https://raw.githubusercontent.com/Devoleksiy/vesta/master/install/vst-install-$type.sh -O vst-install-$type.sh
<<<<<<< HEAD
#  wget https://raw.githubusercontent.com/Devoleksiy/vesta/master/install/vst-install-rhel.sh -O vst-install-rhel.sh
=======

 wget https://raw.githubusercontent.com/Devoleksiy/vesta/master/install/vst-install-rhel.sh -O vst-install-rhel.sh

>>>>>>> 9b85d7a6cc308c2f9ddf68a9b2dc7b4e394d148c
    if [ "$?" -eq '0' ]; then
        bash vst-install-$type.sh $*
        exit
    else
        echo "Error: vst-install-$type.sh download failed."
        exit 1
    fi
fi

# Check curl
if [ -e '/usr/bin/curl' ]; then
#    curl -O http://vestacp.com/pub/vst-install-$type.sh
    # curl -O https://raw.githubusercontent.com/Devoleksiy/vesta/install/vst-install-$type.sh
    if [ "$?" -eq '0' ]; then
        bash vst-install-$type.sh $*
        exit
    else
        echo "Error: vst-install-$type.sh download failed."
        exit 1
    fi
fi

exit
