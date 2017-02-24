# Workstation Setup

This project automates the process of setting up a new Mac OS X based development machine using a simple [Bash](https://www.gnu.org/software/bash/) script.

It was inspired by work done on [Pivotal Labs' Workstation Setup](https://github.com/pivotal/workstation-setup), which has been open sourced to be used and modified by anyone.

I created this fork of that project because the Pivotal Workstation Setup is very opinionated on configuration settings and will **override** certain configurations (e.g. my `vim` configurations)

You can see what gets installed by default [here](#whats-installed) and a list of optional installs that may prove beneficial [here](#optional-installs)

## Pre-Requisites

In order to use this, you will need:
 
* To be running [Mac OS X El Capitan](https://itunes.apple.com/us/app/os-x-el-capitan/id1018109117)
* To have an account with [`sudo`](https://en.wikipedia.org/wiki/Sudo) access


## Installation

To install, simply open up the OS X Terminal and run the following commands:
 
```
$ mkdir -p ~/workspace
$ cd ~/workspace
$ git clone https://github.com/rmkiriako/workstation-setup-mac.git
$ cd workstation-setup-mac
$ ./setup.sh
```

**IMPORTANT:**

* While all of this is mostly automated, you will get prompted for your password several times, so hang around and keep an eye on the screen.

## Post Installation

###  Resolve `git` Installation Correctly

After installing, you may notice that the installed `git` version **is not** what you'd expect, the latest version of `git`.
   
This is because Apple includes an installation of `git` at `/usr/bin/git` and that gets resolved first.

In order to make sure you're using the `git` version that was pulled down in the installation, you'll have to edit `~/.bash_profile` to include:

```
# make sure that items in /usr/local/bin get resolved first
export PATH="/usr/local/bin:$PATH"
```

This ensures that the `/usr/local/bin` directory is searched first, which is where the `git` that's installeed through the `setup.sh` script is put.


## Optional Installs

#### [Bash-it](https://github.com/Bash-it/bash-it)

Bash-it is a collection of community Bash commands and scripts that help ease for your daily work

* Installation:
   
   ```
   $ git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
   $ ~/.bash_it/install.sh
   $ source ~/.bash_profile
   ```

#### [dos2unix / unix2dos](http://dos2unix.sourceforge.net)

Sometimes it is necessary to convert line breaks in a text file from Unix format (line feed) to DOS format (carriage return + line feed).

This functionality is not built into Mac OS X by default but can be added by running:

```
$ brew install dos2unix
```

This will install two commands:

* `dos2unix`: to convert from DOS format to Unix format
* `unix2dos`: to convert from Unix format to DOS format

#### [direnv](https://direnv.net)

This allows you to create a `.envrc` file to set environment variables while you're in that directory. When you navigate out of that directory they are automatically unset.

```
$ cd ~/workspace
$ cd workstation-setup-mac
$ cp bash-it-customizations/direnv.bash ~/.bash_it/custom/direnv.bash
```

#### [Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)

A couple of aliases that I use frequently can be installed by running the below command: 

```
$ cd ~/workspace
$ cd workstation-setup-mac
$ ./setup-git-aliases.sh
```

#### [Git Duet](https://github.com/git-duet/git-duet)

When working in a [pair programming](https://en.wikipedia.org/wiki/Pair_programming) environment, attributing commits to both contributors with built in `git` functionality (where one contributor is the "committer" and the other is the "author") is possible using [git-duet](https://github.com/git-duet/git-duet).

* Installation:

   * Run the below commands:
   
   ```
   brew tap git-duet/tap
   brew install git-duet
   ```

   * Update your `~/.bash_profile` to include the below lines:

   ```
   # .git-authors file for your project
   export GIT_DUET_AUTHORS_FILE=<project-path>/.git-authors
   
   # rotate git author/committer on each commit
   export GIT_DUET_ROTATE_AUTHOR=1   
   ```

* IntelliJ Configuration

   In order for IntelliJ to be able to use `git duet` to commit changes, you'll have to use a [custom script](./intellij-git-duet-wrapper.sh) to intercept calls to `git commit` and have it use `git duet-commit` instead.

   This script was inspired by [a RubyMine wrapper script](https://github.com/git-duet/git-duet/blob/master/scripts/rubymine-git-wrapper) that is maintained inside the public `git-duet` source.

   Run the below to copy the script into the `/usr/local/bin` directory:

   
   ```
   $ cd ~/workspace
   $ cd workstation-setup-mac
   $ cp intellij-git-duet-wrapper.sh /usr/local/bin/intellij-git-duet-wrapper.sh
   ```

   In order to have IntelliJ use this script, you'll have to:

   1) Open IntelliJ
   
   2) Go to Preferences
   
   3) Click on and expand the "Version Control" menu option
   
   4) Select "Git"
   
   5) Set the *"Path to Git executable"* to `/usr/local/bin/intellij-git-duet-wrapper.sh`

* Maintenance:

   * As new members get added to your project, you'll need to update the `.git-authors` file accordingly

* Usage:

   * When you start your day, run one of the below commands:
      * When pairing: `git duet <pair1-initials> <pair2-initials>`
      * When solo-ing: `git solo <initials>`

   * As you get ready to commit changes throughout the day, use the command `git duet-commit` and type your commit message as normal

#### [Oracle SQL Developer](http://www.oracle.com/technetwork/developer-tools/sql-developer/what-is-sqldev-093866.html)

* At this time, it is not possible to install this through [Homebrew](http://brew.sh), so you will have to [download it from Oracle](http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html) and install it manually

#### Pivotal Customizations for iTerm2

Pivotal uses [Bash-it](https://github.com/Bash-it/bash-it) to include some custom scripts that set the color scheme and include the current `git` author(s) in your shell prompt.

It is a requirement to install Bash-it before moving on (see above instructions for the optional Bash-it installation)

* Setting up Pivotal iTerm Colors

   ```
   $ cd ~/workspace
   $ cd workstation-setup-mac
   $ cp pivotal-bash-it-customizations/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
   ```

* Setting `git` Author in Shell Prompt

   ```
   $ cd ~/workspace
   $ cd workstation-setup-mac
   $ cp pivotal-bash-it-customizations/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom/add_user_initials_to_git_prompt_info.bash
   ```

After exccuting the above commands, re-start iTerm to see the changes

#### [Readline Init File](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html)

You can add keybindings to the [Readline library](https://en.wikipedia.org/wiki/GNU_Readline) that make command line use much easier via a `.inputrc` file.

Binding the up/down arrow keys to the command history can prove helpful in order to autocomplete a command that was previously typed.

This functionality is configured in a `.inputrc` file [here](.inputrc).

To add this on a fresh installation, copy this file to your home directory by running:

```
$ cd ~/workspace
$ cd workstation-setup-mac
$ cp .inputrc ~/.inputrc
```

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

### Communication

* CoRD
* Screenhero
* Slack
* Skype
* Teamviewer

### Database

* RoboMongo MongoDB Client	
* SQuirreL SQL Client

### File Sharing

* Dropbox
* FileZilla
* Google Drive

### Java Development

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

### PDF

* PDF Split and Merge

### Source Code Management

* Git
* SourceTree

### Text Editors

* Sublime Text
* TextMate

### Terminal Commands 

* ag
* wget

### Utilities

* 1Password
* Flycut
* iTerm 2
* Jiggler
* Postman
* RightZoom	
* ShiftIt

### Virtualization

* Docker
* Vagrant
* Virtualbox

