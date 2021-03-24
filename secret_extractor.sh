#! /bin/bash

echo "Generating the list of secrets to a text file."
kubectl get secrets | awk '{print$1}' > /tmp/secret-list.txt

echo "Extracting secrets & exporting to YAML files."
while read line; 
 do kubectl get secret $line -o yaml --export > /tmp/$line.yml;
 done
< /tmp/secret-list.txt

echo "Secret YAML files generated. Below is the list."

ls -lh /tmp/$line.yml

echo "Creating a TAR archive of the secret YAML files for the other cluster."

tar -cvf secrets.tar $line.yml