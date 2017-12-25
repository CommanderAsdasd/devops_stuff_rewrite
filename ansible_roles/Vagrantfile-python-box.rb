Vagrant.configure("2") |config|

    hostname = "python.box"
    locale = "en_GB.UTF.8"

    # Box
    config.vm.box = "ubuntu/trusty64"