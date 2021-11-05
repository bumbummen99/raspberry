#!/usr/bin/env bash

##############
# Helper script to keep the global IPv6 of the device up to date with duckdns.org. This is meant to be used in IPv& scenarios such as DS-Lite
# where an IPv4 can NOT be used to reach your devices from the outside.
#
# Note: There is no forwarding in IPv6, but firewall. Make sure to "foreward"/open firewall for the ports in your router - the IPv6 to connect 
# will be the global address of this device, not the external address of your router. You can not use DynDNS IN your router in this scenario.

# Set some basic options
IPV6=$(/sbin/ip -6 addr | grep inet6 | awk -F '[ \t]+|/' '{print $3}' | grep -v ^::1 | grep -v ^fe80 | grep -v ^fd00) # Get global IPv6 and omit locals, make sure this does result in only ONE IPv6
TOKEN="YOURTOKEN"
DOMAIN="YOURDOMAIN"


# Generate the URL and call it
echo url="https://www.duckdns.org/update?domains=${DOMAIN}&token=${TOKEN}&ipv6=${IPV6}" | curl -k -o ~/duckdns/duck.log -K -
