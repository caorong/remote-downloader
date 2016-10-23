
# remote download

## what is this?

In china, because of wall or network problem, we download bt resource is very slow.

so we can first download it on overseas vps use [aria2](https://aria2.github.io/), then use scp pull it to local machine, and use rsync to continue transferring from breakpoint when you want to change proxy vps.

## prepare

config ssh and proxy ssh and without psw when login

[detail in chinese](http://caorong.github.io/2016/09/03/right-way-use-ssh/)

[original english ssh wiki](https://en.wikibooks.org/wiki/OpenSSH/Cookbook/Proxies_and_Jump_Hosts#ProxyCommand_with_Netcat)

e.g

```
Host vps5
HostName vps5_IP
IdentityFile ~/.ssh/id_rsa_4_vps5
Port 22
Compression yes
Cipher blowfish
User root

# config proxyed vps5 use vps3 as proxy
Host proxyed_vps5
HostName vps5_IP
# setisify gateway private key position for connect remote %h %p
ProxyCommand ssh -C -c blowfish -l root -i ~/.ssh/id_rsa_4_vps3 vps3_IP -W %h:%p
# this is private key for destination on local machine
IdentityFile ~/.ssh/id_rsa_4_vps5
Compression yes
Cipher blowfish
Port 22
User root
```


## how to use?

1. scp down.sh to remote machine(which is vps for download file overseas)'s user directory.
```
[root@localhost download]# ls
down.sh
[root@localhost download]# pwd
/root/download
```
2. on local machine choose torrent to download.   
```
./todown.sh vps5 xxxx.mp4.torrent     # server, torrent name
```
3. if you found a more good proxy machine, manually use rsync download it.
```
rsync -z -r --partial --progress --rsh=ssh vps55:download/xxx.mp4  ./
```

## continue download

```
rsync -z -r --partial --progress --rsh=ssh vps55:download/xxx.mp4  ./
```

# TODO

if I have 3 vps, but in this way I can only use one vps as download source

sometime maybe we only have one file to download then I hope to use 3 vps together.
