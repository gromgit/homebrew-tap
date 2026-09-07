# gromgit's General-Purpose Tap

This is the tap in which I dump all the formulae that I expect will be of general interest. I also have other taps for specialized audiences:-

* [gromgit/brewtils](https://github.com/gromgit/homebrew-brewtils) for Homebrew-specific stuff
* [gromgit/dev](https://github.com/gromgit/homebrew-dev) for development tools that don't meet Homebrew core requirements
* [gromgit/fuse](https://github.com/gromgit/homebrew-fuse) for macOS FUSE formulae

## How do I install formulae from this tap?

`brew install gromgit/tap/<formula>`

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "gromgit/tap"
brew "gromgit/tap/<formula>"
```

## How do I install casks from this tap?

`brew install --cask gromgit/tap/<cask>`

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "gromgit/tap"
cask "gromgit/tap/<cask>"
```

**NOTE:** Most (if not all) of these casks have NOT been notarized by Apple, so you'll have to run:

```
xattr -cr /Applications/<cask_app>.app
```

after installation, to remove the macOS quarantine tag from the app before running.

### Wait, why don't you automate that command as part of the cask installation?

Because you would then hold **ME** responsible if the upstream app is quietly subverted, since I took away your last opportunity to say "hang on, something's not quite right".

![](./images/no-time.gif)

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
