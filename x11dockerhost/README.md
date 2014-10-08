#x11dockerhost

If you are using boot2docker on windows or mac:

edit hosts file to include an entry for dockerhost

    192.168.59.103    dockerhost

Windows: Install Xming and set DISPLAY environment variable

ie:

    export DISPLAY=127.0.0.1:0.0

~/.ssh/config entry

    Host x11dockerhost
    HostName dockerhost
    Port 2222
    ForwardAgent yes
    ForwardX11 yes
    ForwardX11Trusted yes

Start the x11dockerhost container and SSH directly into it from your host

    ssh x11dockerhost
