# udemx



# IN "MAIN" BRANCH
Debian11fgery.ova file contain e full Debian 11 OS. I set the root password, an fgery user and 
the /opt and /tmp folder on different partition during installation. 

These below commands is needed to use Ansible. 
    # Need to using Ansible on remote machine
        apt install sudo && adduser fgery sudo
        fgery ALL=(ALL) NOPASSWD: ALL    #>> visudo

    # Modify the default ssh port
    # (There is port forwarding 22 to 2222 in Virtualbox Network.)
        cat << EOF > /etc/ssh/sshd_config.d/modport.conf
        port 2222 
        PasswordAuthentication no
        EOF
        systemctl restart ssh

    # Create and copy ssh key on the host machine
        ssh-keygen -t rsa -b 4096 -m PEM
        ssh-copy-id -i ~/.ssh/id_rsa.pub fgery@192.168.56.1
These are already in the .ova file.

You can use this OS on Oracle Virtualbox where you choose the FILE/IMPORT menu and add the Debian11fgery.ova, and run it.

There are six opened port in the configuration:
22:2222 for ssh
443:443 for Apache webserver
8080:8080 for Jenkins UI
50000:50000 for Jenkins-node communication
8086:8086 for Docker Registry UI
5000:5000 for Docker Registry server

An Ansible-playbook running install the needed applications.
For it, we need the "inventory" file and the "playbook.yml".

Command "ansible-playbook -i inventory playbook.yml"

Before it, check and modify the IP address of your Virtual machine in the "inventory" file.

The playbook install the desired programs, set the desired javac version, add fgery user to sudo, create udemx user, 
run a Hello world container, config the git and clone the repo and start the docker registry and Jenkins.

The "scripts.sh" contains the asked commands.

"preseed.cfg": A Vagrant box base, but it isn't tested.



# IN "REMOTE" BRANCH
There are the necessary elements of Jenkins pipeline.
In the "Apache" folder, there are the Httpd server builder files.

In the "certs" folder, there is the script of tls cert generator.
In the "MariaDB" folder, there is the Dockerfile of Database.

The "Jenkinsfile" contains the pipeline elements.

After entry we need to connect the Host node on the started Jenkins server.










