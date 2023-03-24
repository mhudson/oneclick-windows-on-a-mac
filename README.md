# Run Windows on a Mac

One click run for a VM on macOS containing a trial version of Windows 10 with Office 365. Useful for developing and testing Excel-based financial models.

## Pre-requisites

Run in Terminal:

- [Homebrew](https://brew.sh/) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `brew install ruby`

## Installing & Running

1. Download all files in this folder
1. Run `./run.sh` in Terminal. This will automatically:
   - Installs/updates `homebrew`
   - Installs `vagrant`
   - Downloads Windows 10 Enterprise (trial) VM
   - Boots the VM in 'headless' mode ie it's running, but you can't see it
   - Installs Office 365 on to VM
   - Opens Remote Desktop, ready to connect to the VM
1. Wait about 20-30 minutes. See terminal for the log, and when Office is installed, continue
1. Login to VM using RDP
   - **Username**: `vagrant`
   - **Password**: `vagrant`
1. No need to activate Office or Windows. If the trial expires, and you can't 're-arm' the windows activation, simply remove the Vagrant VM and start again.

Subsequent `./run.sh` will re-use the existing image.

## Shutting Down VM

To close the VM, either select

- Start - Shutdown within Windows; OR
- Run `./stop.sh` in Terminal or double-click in Finder.

## File Access outside the VM

A folder in the VM called `C:\macbook-home` is shared from the host (your Mac) and points to your 'Home' folder. This is set in `Vagrantfile` and can be changed as necessary. You will need to shutdown and restart the VM per instructions above.
