# myvpn

## What is this?
A crude script to setup and use your own [OpenVPN](https://openvpn.net/) server.

## How to setup?

### Server setup

Clone this repo. Run `./myvpn-setup` with following shell variables:

 1. `REMOTE_HOSTNAME`: IP address of remote machine where you want to install OpenVPN server
 2. `REMOTE_USER`: Username you want to run OpenVPN as, on the remote machine
 3. `REMOTE_CONFIG_DIR`: Directory on the remote machine (will be created) where you want to keep the *server configuration file* and key of OpenVPN server
 4. `LOCAL_CONFIG_DIR`: Directory on your local machine (must be a valid writeable directory) where you want to keep _client configuration file_ and key of OpenVPN client 
 5. `VPN_SERVER_NAME`: Just a name for your VPN

For example:

```bash

REMOTE_HOSTNAME=142.93.6.4  REMOTE_USER=root  REMOTE_CONFIG_DIR=/root/myvpn  LOCAL_CONFIG_DIR=/Users/manu/myvpn  VPN_SERVER_NAME=myvpn_toronto_5  ./myvpn-setup

```

Above command will install and setup OpenVPN server on the remote machine. Also, it will create a `$VPN_SERVER_NAME.conf` at `$LOCAL_CONFIG_DIR`.

**Note**: Server setup has been tested on Ubuntu 18 and 20. It *may* work on Debian.

### Client setup

1. Install a client for OpenVPN on your local machine (such as [Tunnelblick](https://tunnelblick.net/)).
2. Create a connection using `$VPN_SERVER_NAME.conf` (in case of Tunnelblick, you'll drag-and-drop `$VPN_SERVER_NAME.conf` onto **VPN Details** window).

## How to use?

### Starting
When you want to use VPN:

 1. Go to directory `$LOCAL_CONFIG_DIR` on your local machine. Run `./start-$VPN_SERVER_NAME.sh` script (this will start the OpenVPN server at remote machine).
 2. Connect to above server using your VPN client.

### Stopping
When you're done using VPN:

 1. Disconnect from remote on your VPN client.
 2. Go to directory `$LOCAL_CONFIG_DIR` on your local machine. Run `./stop-$VPN_SERVER_NAME.sh` script.
