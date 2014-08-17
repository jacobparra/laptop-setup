Laptop-Setup
======

Laptop is the script I use to set up my Ubuntu/Linux laptop.

Requirements
------------

### Linux

* [14.04: Trusty Tahr](https://wiki.ubuntu.com/TrustyTahr/ReleaseNotes),

Install
-------

Read, then run the script:

	wget --no-check-certificate https://raw.githubusercontent.com/jacobparra/laptop-setup/master/laptop-setup.sh
	sh laptop-setup.sh

What it sets up
---------------

* [Bundler] for managing Ruby libraries
* [Exuberant Ctags] for indexing files for vim tab completion
* [Foreman] for serving Rails apps locally
* [Heroku Config] for local `ENV` variables
* [Heroku Toolbelt] for interacting with the Heroku API
* [Hub] for interacting with the GitHub API
* [Homebrew] for managing operating system libraries (OS X only)
* [ImageMagick] for cropping and resizing images
* [Node.js] and [NPM], for running apps and installing JavaScript packages
* [NVM] for managing versions of Node.js
* [Parity] for development, staging, and production parity
* [Postgres] for storing relational data
* [Qt] for headless JavaScript testing via Capybara Webkit
* [Rails] gem for writing web applications
* [Rbenv] for managing versions of Ruby
* [Redis] for storing key-value data
* [Ruby Build] for installing Rubies
* [Ruby] stable for writing general-purpose code
* [The Silver Searcher] for finding things in files
* [Tmux] for saving project state and switching between projects
* [Watch] for periodically executing a program and displaying the output
* [Zsh] as your shell

[Bundler]: http://bundler.io/
[Exuberant Ctags]: http://ctags.sourceforge.net/
[Foreman]: https://github.com/ddollar/foreman
[Heroku Config]: https://github.com/ddollar/heroku-config
[Heroku Toolbelt]: https://toolbelt.heroku.com/
[Hub]: https://hub.github.com/
[Homebrew]: http://brew.sh/
[ImageMagick]: http://www.imagemagick.org/
[Node.js]: http://nodejs.org/
[NPM]: https://www.npmjs.org/
[NVM]: https://github.com/creationix/nvm
[Parity]: https://github.com/croaky/parity
[Postgres]: http://www.postgresql.org/
[Qt]: http://qt-project.org/
[Rails]: http://rubyonrails.org/
[Rbenv]: https://github.com/sstephenson/rbenv
[Redis]: http://redis.io/
[Ruby Build]: https://github.com/sstephenson/ruby-build
[Ruby]: https://www.ruby-lang.org/en/
[The Silver Searcher]: https://github.com/ggreer/the_silver_searcher
[Tmux]: http://tmux.sourceforge.net/
[Watch]: http://linux.die.net/man/1/watch
[Zsh]: http://www.zsh.org/


References
-------

* https://github.com/thoughtbot/laptop
* http://www.unixmen.com/top-things-installing-ubuntu-14-0413-1013-0412-1012-04/
* http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-04-trusty-tahr
* http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu
* "Ubuntu 14.04 LTS Trusty Tahr - Basic packages i usually install"
* https://gist.github.com/h4cc/7be7f940325614dc59fb