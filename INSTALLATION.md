# CREATE A VM UNDER ALPINE LINUX FOR INCEPTION
## INSTALL ALPINE ISO

Go on the Alpine website to [donwload the ISO](https://alpinelinux.org/downloads/), scroll down until you find the virtual section as shown on the picture.

<p align="center">
	<img src="images/00_choose_iso_version.png" alt="Choose ISO Version">
</p>

## CREATE VM
Open VirtualBox and select new to create a new virtual machine.
<p align="center">
	<img src="images/01_select_new.png" alt="VirtualBox Menu">
</p>

Fill the following fields as seen on the picture. Some paths may change depending on where you're storing your ISO and virtual machine.
<p align="center">
	<img src="images/02_VM_name_and_OS.png" alt="Create Virtual Machine">
</p>

The Base Memory and Processors allocated are enough for the VM but you're free to modify these values if you need to.
<p align="center">
	<img src="images/03_VM_hardware.png" alt="Create Virtual Machine">
</p>

The allocated Disk Size is enough for the VM but you're free to modify the value if you need to.
<p align="center">
	<img src="images/04_VM_VDI.png" alt="Create Virtual Machine">
</p>

Once you're done filling all the required fields, a summary may appear depending on the version of VirtualBox you're running.
<p align="center">
	<img src="images/05_VM_summary.png" alt="Create Virtual Machine">
</p>

You can now start your VM ! :)
<p align="center">
	<img src="images/06_select_start.png" alt="Start your VM">
</p>

## SETUP ALPINE ON YOUR VM
Once you've started your VM, connect using the username `root` and type `setup-alpine` to start setting up your VM.
<p align="center">
	<img src="images/07_welcome_message_and_start_setup.png" alt="Starting setup">
</p>

You start by choosing your keymap, mine is qwerty so I'm selecting the `us` keymap.
<p align="center">
	<img src="images/08_keymap.png" alt="Choose your keymap">
</p>

I chose my login as my hostame but you're free to choose any name you wish.
<p align="center">
	<img src="images/09_hostname.png" alt="Choose your hostname">
</p>

I did not do any specific configuration here, I left the values by default.
<p align="center">
	<img src="images/10_interface.png" alt="Choose your interface">
</p>

Now you need to setup a password for root.
<p align="center">
	<img src="images/11_root_password.png" alt="Choose your root password">
</p>

Since I'm in Paris, I chose the Paris sub-timezone but you're free to choose anything.
<p align="center">
	<img src="images/12_timezone.png" alt="Choose your timezone">
</p>

I did not configure any proxy, I left the values by default.
<p align="center">
	<img src="images/13_proxy.png" alt="Proxy config">
</p>

The NTP client is here to ensure you get the correct dates in your VM.
I chose `openntpd` by preference but you're free to choose any NTP client.
<p align="center">
	<img src="images/14_network_time_protocol.png" alt="NTP protocol">
</p>

An APK mirror is going to provide us with alternative locations to download and update software. I choose the fastest one.
<p align="center">
	<img src="images/15_APK_mirror.png" alt="APK mirror">
</p>

I choose not to create a second user as it's not needed for the project but you can create one if you wish. For the ssh server I allowed the root ssh login since I only have a root user. Port forwarding and setting up ssh login is not asked in the project, I did it because it's useful sometimes.
<p align="center">
	<img src="images/16_user.png" alt="Create user">
</p>

Now you're selecting which disk to use to set up the filesystem of your Alpine VM.
<p align="center">
	<img src="images/17_disk_and_install.png" alt="Start your VM">
</p>

The installation is complete, you can now reboot your VM.
<p align="center">
	<img src="images/18_installation_complete.png" alt="Start your VM">
</p>

> [!NOTE]
> You may need to remove the ISO from your VM to prevent accidental reinstallation. Steps are shown in images below.

<p align="center">
	<img src="images/19_remove_optical.png" alt="Start your VM">
</p>
<p align="center">
	<img src="images/19_remove_optical2.png" alt="Start your VM">
</p>

## 🔗 Links 🔗
[Install docker compose](https://geekscircuit.com/install-docker-docker-compose-on-alpine-linux/)

[Install graphic interface](https://www.linkedin.com/pulse/adding-gui-graphical-user-interface-our-alpine-linux-virtual-ionica)

> [!IMPORTANT]
> Reboot your VM once all installations are done
