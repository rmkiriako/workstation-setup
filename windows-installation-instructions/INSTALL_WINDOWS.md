# Installing Windows on a Mac

There are times when you will simply need a Windows machine....

On a Mac, the easiest way to accomplish this by creating a virtual machine and having Windows installed there.


## Pre-Requisites

Before you start on this process, you will need to download:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - an application which allows you to setup Virtual Machines
- [IE11 on Windows 7 (x86)](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/) - a `.zip` file from Microsoft which contains a full blown Windows 7 / IE11 installation (in a format known as an `Appliance`)

### Install VirtualBox

Install VirtualBox by double-clicking the disk image (`.dmg` file) that you downloaded above.

A window will open telling you to double click on the `VirtualBox.mpkg` installer file displayed in that window. This will start the installer, which will allow you to select where to install VirtualBox to.

After installation, you can find a VirtualBox icon in the `Applications` folder in the Finder.

### Extract Windows Appliance

The `IE11.Win7.For.Windows.VirtualBox.zip` file contains a full installation of Windows; however, it is an **unlicensed** copy of Windows. This means that you will need to refresh your installation every 30 days following the Installation Steps below.

Double-click on the `IE11.Win7.For.Windows.VirtualBox.zip` file.

This should create a directory called `IE11 - Win7` and within that directory, you should see two files:

- `IE11 - Win7.ovf`
- `IE11 - Win7-disk1.vmdk`

You should move the entire `IE11 - Win7` directory to a location on your box that you will remember for quick and easy reuse.

<div style="page-break-after: always;"></div>

## Removal Steps

As mentioned above, this is **NOT** a licensed copy of Windows, it is a trial which Microsoft provides for testing purposes.

Every 30 days you will need to remove the entire virtual machine and re-install.

(1) Right-click on the `IE11 - Win7` virtual machine and select `Remove`

   <img src="./remove/01-right-click-remove.png" width="300"></img>

(2) You will get a popup asking if you want to delete all the files that contain the virtual machine from your hard disk, click on the `Delete all files` button

   <img src="./remove/02-delete-all-files.png" width="200"></img>

<div style="page-break-after: always;"></div>

## Installation Steps

(1) Start `VirtualBox`. You should have a blank list of Virtual Machines similar to this:
   
   <img src="./install/01-initial-virtualbox.png" width="300"></img>

(2) Click on `File` => `Import Appliance`

   <img src="./install/02-import-appliance-menu.png" width="200"></img>

(3) Click on the folder icon next to the text field to open a file selector window

   <img src="./install/03-choose-appliance-menu.png" width="200"></img>

(4) Navigate to the appliance file (the `.ovf` file) and click the `Open` button

   <img src="./install/04-select-appliance.png" width="200"></img>

<div style="page-break-after: always;"></div>

(5) Click the `Continue` button on the `Appliance to import` screen

(6) In the `Appliance settings` screen:

   - Check the box below the details of the contained Virtual Machine within the appliance to `Reinitialize the MAC address of all network cards`

   <img src="./install/06-appliance-settings.png" width="300"></img>

   - Click `Import`

(7) You will see a message dialog come up indicating that VirtualBox is `Importing virtual disk image` and this may take some time

   <img src="./install/07-importing-virtual-disk-image.png" width="200"></img>

(8) Right-click on the newly imported `IE11 - Win7` virtual machine and click `Settings`

   <img src="./install/08-settings.png" width="300"></img>

<div style="page-break-after: always;"></div>

(9) Navigate to the `System` tab and provide `2048 MB` of memory to the virtual machine

   <img src="./install/09-provide-enough-memory.png" width="300"></img>

(10) Navigate to the `Shared Folders` tab

   <img src="./install/10-navigate-to-shared-folders.png" width="300"></img>

(11) Click the button to the right of the `Access` column with a folder and `+` icon

(12) In the dialog that opens, expand the dropdown for `Folder Path` and select `Other`

   <img src="./install/12-select-other.png" width="300"></img>

(13) Navigate to your `Desktop` and click `Open`

(14) Click the `OK` button on the remaining dialogs to save all the settings

(15) Start the virtual machine by either:

   - Right-click the name and select `Start`
   - Select the virtual machine and click the `Start` button (the big green arrow)

(16) You may see messages indicating that the keyboard and mouse will be captured in the virtual machine, you can safely close these out by clicking the `X` icon next to them

   <img src="./install/16-keyboard-mouse-capture-messages.png" width="700"></img>

   > **NOTE**: If you see any other messages, do not ignore them!

(17) When prompted for a network type, you can choose Home or Work

(18) Validate that you have internet access by launching Internet Explorer and going to <http://www.yahoo.com> 

(19) Open Windows Explorer, go to `Computer` and click the `Map network drive` button

   <img src="./install/19-map-network-drive-button.png" width="300"></img>

<div style="page-break-after: always;"></div>

(20) When the `Map Network Drive` dialog opens, type `\\vboxsvr\desktop` in the folder path and click `Finish`

   <img src="./install/20-network-drive-folder.png" width="300"></img>

(21) You should now `Z:` drive is available for transferring data between the Windows guest machine and Mac host. Any files on your `Desktop` in your Mac OS will show up here.

   <img src="./install/21-validate-network-drive-works.png" width="300"></img>

<div style="page-break-after: always;"></div>

(22) Navigate to `C:/Windows/System32/drivers/etc`, right-click on the `hosts` file, and select `Properties`

   <img src="./install/22-hosts-file-properties.png" width="300"></img>

(23) Navigate to the `Security` tab, select the `Users` item, and click `Edit`

   <img src="./install/23-security-tab.png" width="300"></img>

<div style="page-break-after: always;"></div>

(24) Select the `Users` item again, check the `Allow` box for `Full control`, and click `Apply`

   <img src="./install/24-give-users-full-control.png" width="300"></img>

(25) Windows will throw up a warning that you're modifying a system file, you can safely ignore this and click `Yes`

   <img src="./install/25-windows-warning-system-file.png" width="300"></img>

(26) Click `OK` on the remaining dialogs

(27) Double-click the `hosts` file, and choose to open it with `Notepad`

   <img src="./install/27-open-with-notepad.png" width="300"></img>

<div style="page-break-after: always;"></div>

(28) Add a row to bind `10.0.2.2` to `localhost`, detailed [here](http://stackoverflow.com/questions/1261975/addressing-localhost-from-a-virtualbox-virtual-machine), which basically exposes any local development done in your Mac OS to your Windows virtual machine

   <img src="./install/28-bind-guest-localhost-to-machine-host.png" width="300"></img>

(29) You should be able to launch a browser and go to your running application on your Mac OS from within an IE session in your Windows virtual machine (e.g. <http://localhost:9000>)

(30) Click on the `Start` button and search for `Windows Update`

   <img src="./install/30-search-for-windows-update.png" width="300"></img>

<div style="page-break-after: always;"></div>

(31) Click on the `Change settings` link on the left menu

   <img src="./install/31-change-settings.png" width="300"></img>

(32) Select the `Never check for updates (not recommended)` option in the dropdown under `Important updates` and click `OK`

   <img src="./install/32-never-check-for-updates.png" width="300"></img>

