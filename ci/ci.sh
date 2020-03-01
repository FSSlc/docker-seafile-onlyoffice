#!/bin/bash

version=6.3.13
set -e -x
./ci/install_deps.sh

(
    cd image
    make base
    make pro-base
    make pro-server
)

mkdir -p /opt/seafile-data
docker run -d --name seafile -e SEAFILE_SERVER_HOSTNAME=127.0.0.1 -v /opt/seafile-data:/shared -p 80:80 -p 443:443 fsslc/seafile-pro:$version

cat > doc.md <<EOF
# Doc

Hello world.
EOF

sleep 50
python ci/upload.py doc.md
python ci/validate_file.py doc.md
docker restart seafile
sleep 30
python ci/validate_file.py doc.md
docker rm -f seafile
docker run -d --name seafile -e SEAFILE_SERVER_HOSTNAME=127.0.0.1 -v /opt/seafile-data:/shared -p 80:80 -p 443:443 fsslc/seafile-pro:$version
sleep 30
python ci/validate_file.py doc.md

rm -rf doc.md

bash ci/publish-base.sh
bash ci/publish-pro-base.sh
bash ci/publish-pro-image.sh
