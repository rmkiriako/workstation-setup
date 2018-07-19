# Workstation Setup

This project automates the process of setting up a new Mac OS X based development machine using a simple [Bash](https://www.gnu.org/software/bash/) script.

It was inspired by work done on [Pivotal Labs' Workstation Setup](https://github.com/pivotal/workstation-setup), which has been open sourced to be used and modified by anyone.

I created this fork of that project because the Pivotal Workstation Setup is very opinionated on configuration settings and will **override** certain configurations (e.g. my `vim` configurations)


## Pre-Requisites

In order to use this, you will need:
 
* To be running [Mac OS X El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117)
* To have an account with [`sudo`](https://en.wikipedia.org/wiki/Sudo) access


## Installation

To install, simply open up the OS X Terminal and run the following commands:
 
```
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/rmkiriako/workstation-setup-mac.git
cd workstation-setup-mac
./setup.sh
```

**IMPORTANT:**

* While all of this is mostly automated, you will get prompted for your password several times, so hang around and keep an eye on the screen.


## Post Installation

After you complete the installation, you will need to do some manual tasks to get everything working correctly.

A list of post installation items can be seen [here](./POST_INSTALLATION.md)


## Optional Installs

After installing the below items, you may want to install a few other tools that I find very useful.

A non-exhaustive list of items can be seen [here](./OPTIONAL_INSTALLS.md)


## What's Installed?

### Browsers

* Firefox
* Google Chrome

### CD / DVD

* Burn
* DVD Styler
* Handbrake

### Cloud

* Cloud Foundry CLI
* Heroku CLI

### Communication

* CoRD
* Screenhero
* Slack
* Skype
* Teamviewer

### Database

* pgAdmin4 Management Tools for PostgreSQL
* Robo-3T (formerly RoboMongo) MongoDB Client	
* SQuirreL SQL Client

### File Sharing

* Box Drive
* Dropbox
* FileZilla
* Google Backup and Sync

### Java Development

* Ant
* Gradle
* IntelliJ IDEA (Ultimate  Edition)
* Java
* Maven

### JavaScript Development

* Grunt
* Gulp
* NodeJS

### Markdown Editor

* MacDown

### Media

* 4K Video Downloader
* Flash Player
* Soundflower
* VLC

### Network Tools

* Newman
* Postman
* Wireshark

### PDF

* PDF Split and Merge

### Python

* PyCharm IDE

### Source Code Management

* Git
* SourceTree

### Text Editors

* Sublime Text
* TextMate

### Terminal Commands 

* ag
* jq
* unrar
* wget

### Utilities

* 1Password
* Flycut
* iTerm 2
* Jiggler
* ShiftIt
* UnrarX

### Virtualization

* Docker
* Vagrant
* Virtualbox

