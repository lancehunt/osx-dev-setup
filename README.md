# osx-dev-setup
Bash script to automate setting up a new Mac from scratch

# Quickstart
```
$ cd ~; git remote add origin https://github.com/lancehunt/osx-dev-setup.git; git fetch; git reset --hard origin/master;
```

# Usage

```
./setup.sh all
```

OR, run just 1 script (brew in this case):

```
./setup.sh brew
```

# Available Scripts

* `osxprep.sh` minimum requirements setup before other scripts are run
* `osx.sh` change osx default settings and install updates
* `apps.sh` install my prefered apps
* `dev-tools.sh` install everything I need to start developing with my preferred languages
* `docker.sh` install docker tools required to interact with and create containers
* `aws.sh` install tools for interacting with AWS





