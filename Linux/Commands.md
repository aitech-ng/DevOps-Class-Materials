# Linux Commands

- View the content of a file.

```bash
cat file.txt
```

- View the first 5 lines of a file.

```bash
head -n 5 file.txt
```

- View the last 5 lines of a file.

```bash
tail -n 5 file.txt
```

- Print the path of the current working directory, starting from the root.

```bash
pwd
```

- Create a file or edit a file's timestamp.

```bash
touch file.txt
```

- Perform mathematical calculations through the command line.

```bash
echo "11+5" | bc
```

- Check the free space on a Linux/Unix system.

```bash
df -h
```

- Check the free memory on a Linux/Unix system.

```bash
free -h
```

- Print out all system information.

```bash
uname -a
```

- Display dynamic real-time information about running processes:

```bash
top
```

- Create a directory/folder.

```bash
mkdir NewFolder
```

- Display the line of text/string on the terminal or into a file.

```bash
echo "Hello World!"

echo "Some text" > file.txt

echo "Some new text" >> file.txt
```

- Show current user.

```bash
whoami
```

- Check all groups a specific user belongs to.

```bash
groups victor
```

- Change a user's password.

```bash
passwd
```

- Displays information about the users that are currently
active on the machine and their processes.

```bash
w
```

- List of the last 500 commands used.

```bash
history

history | grep docker
```

- Display CPU Architecture info.

```bash
lscpu
```

- Copy ﬁles or group of ﬁles or directory.

```bash
cp file.txt NewFolder/

cp NewFolder/file.txt NewerFolder/

cp -r NewFolder/ NewerFolder/

cp -RT NewFolder/ NewerFolder/
```

- Move ﬁles or group of ﬁles or directory.

```bash
mv file.txt NewFolder/

mv NewFolder/file.txt NewerFolder/

mv NewFolder/ NewerFolder/

mv NewFolder/* NewerFolder/
```

- Delete ﬁles or group of ﬁles or directory.

```bash
rm file.txt

rm NewerFolder/

rmdir NewerFolder/

rm -r NewerFolder/
```

- Rename ﬁles or directory.

```bash
cp oldfilename.txt newfilename.txt

mv oldfilename.txt newfilename.txt
```

- Identify programs and processes that are running on the system and the resources they are using.

```bash
ps -A

ps aux | grep openshot
```

- Terminate processes manually.

```bash
kill <pid>
```

- Print a list of the current environment variables.

```bash
env

env -u variable_name
```

- Create/edit text ﬁles.

```bash
nano file.txt
```

- Create/edit text ﬁles.

```bash
nano file.txt
```

- Clear terminal screen.

```bash
clear
```

- For downloading ﬁles from the Internet.

```bash
wget https://releases.ubuntu.com/20.04/ubuntu-20.04.3-desktop-amd64.iso
```

- Transfer data from or to a server.

```bash
curl -sL https://deb.nodesource.com/setup_18.x
```

- List of all the users that have logged in and out.

```bash
last -5 
```

- Execute a command as another user.

```bash
sudo cp file.txt /etc 
```

- Debian package manager

```bash
apt update

apt upgrade

apt install nginx 

apt install postgresql -y

apt install docker --fix-broken

apt-add-repository ppa:ansible/ansible

apt search

apt remove nginx

apt remove nginx --purge
```

- Red Hat package manager

```bash
yum history

yum history undo <id>

yum update

yum install nginx 

yum update nginx 

yum module enable php:remi-8.2 -y

yum remove nginx
```

- Check ip address

```bash
ip a
```

- Check network interface and ip address

```bash
ifconfig
```

- Kill a Port

```bash
sudo fuser -k 8080/tcp
```