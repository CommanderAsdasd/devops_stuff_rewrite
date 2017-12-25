MARK_DEV_PREFIX="/run/network/ifup."
MARK_STATIC_NETWORK_EMITTED="/run/network/static-network-up-emitted"

if [ -e /lib/lsb/init-functions ]; then
    . /lib/lsb/init-functions
fi