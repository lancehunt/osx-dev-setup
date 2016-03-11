# osx-dev-setup
Bash script to automate setting up a new Mac from scratch

# Quickstart
```
$ cd ~; curl -#L https://github.com/lancehunt/osx-dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE,CREDITS.md}
```

# Usage

```
./init all
```

OR, to run just 1 script (brew in this case):

```
./init brew
```

# Available Scripts

* `osxprep.sh` minimum requirements setup before other scripts are run
* `osx.sh` change osx default settings and install updates
* `apps.sh` install my prefered apps
* `dev-tools.sh` install everything I need to start developing with my preferred languages
* `docker.sh` install docker tools required to interact with and create containers
* `aws.sh` install tools for interacting with AWS





