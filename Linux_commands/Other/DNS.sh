### Reverse DNS - find DNS name for IP
# Consul port
dig @127.0.0.1 -p 8600 +noall +answer -x IP_ADDRESS
# General use with full output
dig -x IP_ADDRESS
