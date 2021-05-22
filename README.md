# nodeselector's dotfiles

![https://xkcd.com/1319/](https://imgs.xkcd.com/comics/automation.png)

[![Test](https://github.com/nodeselector/dotfiles/actions/workflows/test.yml/badge.svg)](https://github.com/nodeselector/dotfiles/actions/workflows/test.yml)

## Usage

### Install Script

Useful for development instances:

`./setup.sh`

### Command Line

The setup command adds an alias for a helper tool:

```
$ dotfiles help
nodeselector's dotfiles

Syntax: dotfiles (help | clean | setup | reload | bootstrap | clean)
options:
reload                Reload dotfiles. Do this when you change stuff.
setup                 Run this for initial setup. Note, it doesn't remove dependencies.
bootstrap             Install or update dependencies
clean                 Remove dotfiles from home directory.
macos                 Run macos system configuration.
```