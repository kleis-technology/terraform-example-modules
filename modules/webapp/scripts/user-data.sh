#!/bin/bash
set -e

apt update
apt -y install nginx golang-petname

cat > /var/www/html/index.html <<EOF
<h1>Hello, World</h1>
<p>My name is <q>${server_name}!</q></p>
<p>My local name is <q>$(golang-petname -words 4)</q>!</p>
EOF
