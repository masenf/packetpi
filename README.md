# PacketPi
Is an ansible configuration that provisions linux AX25 tools on a Raspberry Pi
or x86 systems.

# Instructions
Boot the Raspberry Pi OS Lite image (may work on other Debian based OS) and
install Ansible and Git.

Clone this repo and edit the variables in [`station.yml`](./station.yml):
* update your callsign and netrom alias
* add configuration for desired services

Run the following commands on the machine:

```
apt-get update && apt-get install ansible git
git clone https://github.com/maxlock/packetpi
cd packetpi
ansible-galaxy install -r ./requirements.yml -p roles
```
Now you can run Ansible to create a basic client-only deployment according to
the settings in `station.yml`

```
ansible-playbook -K -i inventory -e @station.yml basic_client.yml
```

Or a full packet node and rmsgw server:


```
ansible-playbook -K -i inventory -e @station.yml services.yml
```

You will now have a fully operational packet node. You can connect to the node
app by telnetting to port 4444

```
pi@raspberrypi:~ $ telnet localhost 4444
Trying ::1...
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

LinuxNode v0.3.2 (g7uoz-1)

login: g7uoz
#UOZNOD:G7UOZ-1 Welcome to g7uoz-1 network node

Type ? for a list of commands. help <commandname> gives a description
of the named command.

--

?
#UOZNOD:G7UOZ-1 Commands:
?, Bye, Connect, ECho, Escape, Finger, Help, HOst, Info, Links
Mheard, NLinks, Nodes, PIng, Ports, Routes, Status, TAlk, Telnet, TIme
Users, ZConnect, ZTelnet

```
