#!/bin/bash

rm -f *.der
rm -f *.info

for filename in ./*.bin; do
    [ -e "$filename" ] || continue
    readmbn  $filename > $filename.info
    readmbn -e x509 -o $filename.der $filename
    openssl x509 -in $filename.der  -inform der -text -noout >> $filename.info
done
