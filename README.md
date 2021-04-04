# nyzo docker (CE-version). Make your life easier.

Docker container builder and utils for Nyzo-verifier. The container uses lightweight linux alpine3.8 and minimal dependencies for nyzo verifier. You can use this for your current servers/vps that still have free resource to participate in nyzo lottery. The scripts handle almost everything for you to set up a nyzo node on linux. There are some utils for you to quickly check and manage your verifiers.

The scripts are well-tested on Ubuntu 18.04 and 20.04. Feel free to make a PR to support other linux os.

### Installation

This script only supports Linux:

```shell
apt update;
apt install docker docker-compose docker.io haveged supervisor git curl -y;
```
(also need to run `apt upgrade` for (very) old system)
```
git clone https://github.com/krypdkat/nyzoDocker.git;
cd nyzoDocker;
echo "export PATH=$PATH:`pwd`" >> ~/.bashrc;
echo "export NYZOD_PATH=`pwd`" >> ~/.bashrc;
source ~/.bashrc;
```

### First time running

One line command that will do everything for you.

```shell
nyzod freshinstall
```
After running above command, your verifier node is set up. You should wait a minute then run `nyzod check 127.0.0.1` to check your verifier status.
It may take more than 8 hours for your verifier info showing up on: https://nyzo.today/queue/ or https://nyzo.co/queue


### Migrating from other system

```shell
nyzod freshinstall [nickname] [privatekey]
```

#### Usage

```
Utils for nyzo docker:
Usage: nyzod [COMMAND]
-----------------
Command list:
    attach: attach into nyzo-verifier instance with bash (advanced user only)
    check: check status of nyzo-verifier instance or other verifier with given IP
         usage: nyzod check [IP] (if [IP] is empty, it will check localhost)
    getkey: get the private key of your verifier
    getnick: get the nickname of your verifier
    getresource: get the amount of resource (cpu, ram) for nyzo verifier
    start: start nyzo-verifier instance
    stop: stop nyzo-verifier instance
    setram: set the amount of ram for nyzo verifier
         usage: nyzod setram [AMOUNT_IN_MEGABYTE]. ex: nyzod setram 512mb
    setcpu: set the amount of cpu cores for nyzo verifier
         usage: nyzod setcpu [N_CORE] (can be floating point). ex: nyzod setcpu 1.5 (1.5 cores)
    restart: restart nyzo instance
     [INSTALLATION]
    destroy: delete nyzo-verifier instance for another new fresh installation
    freshinstall: will run and install everything the verifier needs
         usage: nyzod freshinstall [NICKNAME] [PRIVATE_KEY]
         (if [NICKNAME] [PRIVATE_KEY] are not set, nickname will be your host name, private key is a random one)
         [LIMIT_AMOUNT_OF_RAM_IN_BYTES] & [LIMIT_AMOUNT_CPU_CORE] can be set by running nyzod setram or nyzod setcpu
         by default LIMIT_AMOUNT_OF_RAM_IN_BYTES=512mb and LIMIT_AMOUNT_CPU_CORE=1
    help: show this message
```

#### Limiting resource for verifier
```
    setram: set the amount of ram for nyzo verifier
         usage: nyzod setram [AMOUNT_IN_MEGABYTE]. ex: nyzod setram 512mb
```

```
    setcpu: set the amount of cpu cores for nyzo verifier
         usage: nyzod setcpu [N_CORE] (can be floating point). ex: nyzod setcpu 1.5 (1.5 cores)
```
By default, it limits RAM to 512mb and cpu core number to 1. Run `docker stats` to monitor the resource.


## License

Feel free to use for any purposes.