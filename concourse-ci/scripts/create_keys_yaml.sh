#! /bin/bash

# Add to the file one line at a time

echo "token_signing_key:" > secrets.yml
echo "  private_key: |" >> secrets.yml

ssh-keygen -t rsa -f session_signing_key -N ''
sed -e 's/^/  /' session_signing_key >> secrets.yml
echo "  public_key: " `cat session_signing_key.pub` >> secrets.yml

# Add Host Key
echo "tsa_host_key:" >> secrets.yml
echo "  private_key: |" >> secrets.yml
ssh-keygen -t rsa -f tsa_host_key -N ''
sed -e 's/^/  /' tsa_host_key >> secrets.yml
echo "  public_key: " `cat tsa_host_key.pub` >> secrets.yml

# Add Worker Key
echo "worker_key:" >> secrets.yml
echo "  private_key: |" >> secrets.yml
ssh-keygen -t rsa -f worker_key -N ''
sed -e 's/^/  /' worker_key >> secrets.yml
echo "  public_key: " `cat worker_key.pub` >> secrets.yml

