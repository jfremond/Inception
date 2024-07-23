# Download baseImage
FROM	alpine:3.19

# Update and upgrade alpine
# Install nginx and openSSL
# Generate ssl cert and key
# req		=> request a certificate
# -newkey	=> generate a new private key
# rsa:4096	=> RSA algo is used, size of key is of 4096 bits
# -days		=> validity of the key in days
# -nodes	=> not use a passphrase
# -x509		=> create a self-signed certificate
# -subj		=> answer prompt non-interactively
# -out		=> where the certificate is saved
# -keyout	=> where the key is saved
RUN apk update && apk upgrade &&\
	apk add --no-cache nginx openssl &&\
	openssl req -newkey rsa:4096 -days 365 -nodes -x509\
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=jfremond.42.fr/UID=jfremond"\
	-out /etc/ssl/certs/selfsigned.crt\
	-keyout /etc/ssl/private/selfsigned.key

# Copy nginx config
COPY	conf/nginx.conf /etc/nginx/http.d/

# Run nginx in foreground
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
