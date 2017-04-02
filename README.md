# debian-autoinstall
http://le9i0nx.github.io/debian-autoinstall/preseed.cfg

http://le9i0nx.github.io/debian-autoinstall/authorized_keys

build_iso.sh creates an image of the auto install debian stable aimed at the configuration file on github.io

# debian autoinstall aws

wget https://le9i0nx.github.io/debian-autoinstall/build_iso/debian_stable_aws.sh --no-check-certificate -v -O install.sh && sh ./install.sh; rm -rf install.sh

# copy key

wget https://le9i0nx.github.io/debian-autoinstall/ssh.sh -v -O ssh.sh && sh ./ssh.sh; rm -rf ssh.sh
