DEPRECATED. Dip doesn't prive binaries anymore. It's just a Ruby gem now.
=========================================================================

DIP Homebrew Tap
=====================

This is a [Homebrew][brew] tap for formulae for the [dip](https://github.com/bibendi/dip).


Setup
-----

Using these formulae requires Homebrew.

Once homebrew is installed, simply run:

    brew tap bibendi/dip

Use
---

To install software, just use `brew install` with the name of the formula. You
may wish to run `brew update` before hand to get the latest version of the
formulae. For example, to install the latest version of dip:

    brew update
    brew install dip

To upgrade software:

    brew update
    brew upgrade    # upgrade all software installed with Homebrew
    brew upgrade dip # update just the dip formula


Contributing
------------

Please file bug reports and feature requests as GitHub issues against the individual project, not this repository.


References
----------
`brew help`, `man brew`, or the Homebrew [documentation][].

[brew]: http://brew.sh/
[style]: https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md
[documentation]: https://github.com/Homebrew/brew/blob/master/docs/README.md
