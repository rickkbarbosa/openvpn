#!/bin/bash
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source ${HERE}/.env
USER=${1}

docker run -v $OVPN_DATA:/etc/openvpn --rm -it ${DOCKER_OVPNIMAGE} easyrsa build-client-full ${USER} nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm ${DOCKER_OVPNIMAGE} ovpn_getclient ${USER} > ${HERE}/keys/${USER}.ovpn
