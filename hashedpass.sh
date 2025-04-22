#!/bin/bash

username=username
password=$(openssl rand -base64 18)
# Generate 64-byte random salt (hex encoded)
salt=$(openssl rand -hex 64)
# Concatenate password and salt, compute SHA-256 hash
hash=$(echo -n "${password}${salt}" | openssl dgst -sha256 | awk '{print $2}')

token=$(echo -n "$username:$password" | base64 )

echo "User: $username"
echo "Pass: $password"
echo "Salt: $salt"
echo "Hash: $hash"
echo "Token: $token"
