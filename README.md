# Dotfiles
This is a collection of my dotfiles for various applications and packages.

![screenshot](./resources/screenshot.png)

## Setup

There are two main dependencies for running my dotfiles. [Homebrew](https://brew.sh/) and [SaltStack](https://www.saltstack.com/).

### Homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### SaltStack
```
brew install salt
```

Note:
Since `Homebrew` is designed to work without using sudo it is recommended to create, and give read and write access to the following folders manually:

- etc/salt
- /var/cache/salt
- /var/log/salt
- /var/run/salt

You can run the following commands to create the folders, and give the permissions. Replace `user` with your user.

```
sudo mkdir /etc/salt /var/cache/salt /var/log/salt /var/run/salt
sudo chown -R user /etc/salt /var/cache/salt /var/log/salt /var/run/salt
```

## Running
To run a specific state you can use the following. Replace `nvim` with the desired state.
```
salt-call --config=./ --refresh-grains-cache state.sls nvim
```

To get full state run
```
salt-call --config=./ state.apply
```
