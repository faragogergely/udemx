# udemx

Debian11fgery.ova file contain e full Debian 11 OS. I set the root password, an fgery user and the /opt and /tmp folder on different partition during installation. 

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

