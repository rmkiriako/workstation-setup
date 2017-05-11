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

### Setup `vim` as the `git` Editor

Run the below command to set `vim` as the preferred `git` editor:

```
git config --global core.editor "vim"
```
