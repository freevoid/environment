#!/bin/sh
# Usage: proxy.sh <host-spec> [<proxyport>] [<port>]
# Creates ssh tunnel to host and local SOCKS server that can be used as web proxy
proxyport=${2:-8080}
port=${3:-22}
ssh -C2qTnN -D $proxyport $1 -p $port

