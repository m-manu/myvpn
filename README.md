# myvpn

## What is this?
A crude script to setup and start your own OpenVPN server

## How to use this?

### Server setup
* Fill file `parameters` with appropriate values
 * **Note**: All the shell variables specified below are references to the shell variables you've specified in `parameters` file 
* Run `./myvpn-setup`
 * This will install and setup [OpenVPN](https://openvpn.net/) server in remote machine.
 * Also, this will create a `$VPN_SERVER_NAME.conf` at `$CLIENT_CONFIG_LOCATION` you've specified in your [parameters](./parameters) file

### Client setup
* Install a client for OpenVPN (such as [Tunnelblick](https://tunnelblick.net/))
* Create a connection using `$VPN_SERVER_NAME.conf` (in case of Tunnelblick, you'll drag-and-drop `$VPN_SERVER_NAME.conf` onto *VPN Details* window)

### Actual use
* Go to directory `$LOCAL_CONFIG_LOCATION`
* Run `./start-$VPN_SERVER_NAME` (this will start [OpenVPN](https://openvpn.net/) server at remote)
* Connect to above server using VPN client
