#!/bin/bash
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
source ${HERE}/.env
OVPN_DATA=/opt/openvpn/data


mkdir -p ${OVPN_DATA}
docker run -v $OVPN_DATA:/etc/openvpn --rm ${DOCKER_OVPNIMAGE} ovpn_genconfig -u udp://${VPN_SERVERNAME} 
docker run -v $OVPN_DATA:/etc/openvpn --rm -it ${DOCKER_OVPNIMAGE} ovpn_initpki nopass

#Append routes
#docker-compose run --rm openvpn rm /etc/openvpn/ovpn_env.sh
#docker-compose run --rm openvpn ovpn_genconfig -N -d -n 192.168.13.6 -u udp://${VPN_SERVERNAME} -p "route 192.168.13.0 255.255.255.0" -p "route 172.17.0.0 255.255.0.0"
