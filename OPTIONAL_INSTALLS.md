## Optional Installs

#### [Bash-it](https://github.com/Bash-it/bash-it)

Bash-it is a collection of community Bash commands and scripts that help ease for your daily work

* Installation:
   
   ```
   git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
   ~/.bash_it/install.sh
   source ~/.bash_profile
   ```

#### [dos2unix / unix2dos](http://dos2unix.sourceforge.net)

Sometimes it is necessary to convert line breaks in a text file from Unix format (line feed) to DOS format (carriage return + line feed).

This functionality is not built into Mac OS X by default but can be added by running:

```
brew install dos2unix
```

This will install two commands:

* `dos2unix`: to convert from DOS format to Unix format
* `unix2dos`: to convert from Unix format to DOS format

#### [direnv](https://direnv.net)

This allows you to create a `.envrc` file to set environment variables while you're in that directory. When you navigate out of that directory they are automatically unset.

```
cd ~/workspace
cd workstation-setup-mac
cp bash-it-customizations/direnv.bash ~/.bash_it/custom/direnv.bash
```

#### [Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)

A couple of aliases that I use frequently can be installed by running the below command: 

```
cd ~/workspace
cd workstation-setup-mac
./setup-git-aliases.sh
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
   cd ~/workspace
   cd workstation-setup-mac
   cp intellij-git-duet-wrapper.sh /usr/local/bin/intellij-git-duet-wrapper.sh
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
   cd ~/workspace
   cd workstation-setup-mac
   cp pivotal-bash-it-customizations/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
   ```

* Setting `git` Author in Shell Prompt

   ```
   cd ~/workspace
   cd workstation-setup-mac
   cp pivotal-bash-it-customizations/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom/add_user_initials_to_git_prompt_info.bash
   ```

After exccuting the above commands, re-start iTerm to see the changes

#### [Readline Init File](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html)

You can add keybindings to the [Readline library](https://en.wikipedia.org/wiki/GNU_Readline) that make command line use much easier via a `.inputrc` file.

Binding the up/down arrow keys to the command history can prove helpful in order to autocomplete a command that was previously typed.

This functionality is configured in a `.inputrc` file [here](.inputrc).

To add this on a fresh installation, copy this file to your home directory by running:

```
cd ~/workspace
cd workstation-setup-mac
cp .inputrc ~/.inputrc
```

#### Windows on a Mac

Occasionally, you will need to use Windows or Internet Explorer, and the easiest way to do this is to install a Windows virtual machine that has Internet Explorer on it.

You can see detailed instructions on this [here](./windows-installation-instructions/Installing_Windows_On_Mac.pdf)

#### [Bash Git Completion](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion)
Git-Flow completion

```$xslt
brew install bash-completion
```
* add bash completion to your .bash_profile
```$xslt
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
```