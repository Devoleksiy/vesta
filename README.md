[Vesta Control Panel](http://vestacp.com/)
==================================================

[![Join the chat at https://gitter.im/vesta-cp/Lobby](https://badges.gitter.im/vesta-cp/Lobby.svg)](https://gitter.im/vesta-cp/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is a fork of the legendary vectacp from [Serghey Rodin](https://github.com/serghey-rodin). Thank you Sergey.
----------------------------

The fork is targeting **centos 8** and new releases, for other versions I have not tested.
* Vesta is an open source hosting control panel. 
* Vesta has a clean and focused interface without the clutter.
* Vesta has the latest of very innovative technologies.

How to install (2 step)
----------------------------
Connect to your server as root via SSH
```bash
ssh root@your.server
```

Download the installation script, and run it:
```bash
curl -O https://raw.githubusercontent.com/Devoleksiy/vesta/master/install/vst-install.sh | bash
```

How to install (3 step)
----------------------------
If the above example does not work, try this 3 step method:
Connect to your server as root via SSH
```bash
ssh root@your.server
```

Download the installation script:
```bash
curl -O https://raw.githubusercontent.com/Devoleksiy/vesta/master/install/vst-install.sh
```
Then run it:
```bash
bash vst-install.sh
```
Fix
----------------------------
Need work after installed
After successful installation, recreate the user.
```bash
v-rebuild-user admin
```

You can still do:
Delete file from ip in / usr / local / vesta / data / ips directory
and run:
```bash
v-update-sys-ip
```

License
----------------------------
Vesta is licensed under  [GPL v3 ](https://github.com/serghey-rodin/vesta/blob/master/LICENSE) license

