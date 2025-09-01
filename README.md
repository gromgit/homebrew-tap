# gromgit's General-Purpose Tap

This is the tap in which I dump all the formulae that I expect will be of general interest. I also have other taps for specialized audiences:-

* [gromgit/brewtils](https://github.com/gromgit/homebrew-brewtils) for Homebrew-specific stuff
* [gromgit/dev](https://github.com/gromgit/homebrew-dev) for development tools that don't meet Homebrew core requirements
* [gromgit/fuse](https://github.com/gromgit/homebrew-fuse) for macOS FUSE formulae

## How do I install these formulae?

`brew install gromgit/tap/<formula>`

Or `brew tap gromgit/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "gromgit/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
