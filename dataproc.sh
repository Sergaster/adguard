#!/bin/bash

BASEDIR=/home/sergey/src/git/oid-tools/
PATH=$PATH:$BASEDIR/tools/

echo $1

cp src/CertUtil-gnutls-win.txt .
cp src/CertUtil-openssl-win.txt .
cp src/CertUtil-microsoft-win.txt .
cp src/CertUtil-misc-win.txt .
cp src/CertUtil-ldap-attributetype-win.txt .
cp src/CertUtil-ldap-objectclass-win.txt .

dos2unix CertUtil-gnutls-win.txt
dos2unix CertUtil-openssl-win.txt
dos2unix CertUtil-microsoft-win.txt
dos2unix CertUtil-misc-win.txt
dos2unix CertUtil-ldap-attributetype-win.txt
dos2unix CertUtil-ldap-objectclass-win.txt

iconv -f $1 -t UTF-8 CertUtil-gnutls-win.txt > CertUtil-gnutls.txt
iconv -f $1 -t UTF-8 CertUtil-openssl-win.txt > CertUtil-openssl.txt
iconv -f $1 -t UTF-8 CertUtil-microsoft-win.txt > CertUtil-microsoft.txt
iconv -f $1 -t UTF-8 CertUtil-misc-win.txt > CertUtil-misc.txt
iconv -f $1 -t UTF-8 CertUtil-ldap-attributetype-win.txt > CertUtil-ldap-attributetype.txt
iconv -f $1 -t UTF-8 CertUtil-ldap-objectclass-win.txt > CertUtil-ldap-objectclass.txt

parser_win $BASEDIR/eku/eku-gnutls.txt CertUtil-gnutls.txt > gnutls.pot
parser_win $BASEDIR/eku/eku-openssl.txt CertUtil-openssl.txt > openssl.pot
parser_win $BASEDIR/eku/eku-microsoft.txt CertUtil-microsoft.txt > microsoft.pot
parser_win $BASEDIR/eku/eku-misc.txt CertUtil-misc.txt > misc.pot
parser_win $BASEDIR/eku/eku-ldap-attributetype.txt CertUtil-ldap-attributetype.txt > ldap-attributetype.pot
parser_win $BASEDIR/eku/eku-ldap-objectclass.txt CertUtil-ldap-objectclass.txt > ldap-objectclass.pot

potsum *.pot > ../win$2-$1.pot
rm -f *.txt *.pot
