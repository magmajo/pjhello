# http://blog.saltfactory.net/221

mkdir data
cd data

## create private key 
openssl genrsa 1024 > key.pem

## create digital certification
openssl req -x509 -new -key key.pem > cert.pem