![orizn prototype logo title](http://cl.ly/image/2B452k1i413h/orizn-logo.png)

orizn:prototype is a minimal 2d game prototype written in Ruby using the Gosu Framework. Features are:

* Ability to load different scenes
* Simple, memory friendly particle engine to shoot bullets
* Simple Collision Detection using features provided with the Gosu Framework
* Dynamic Background

## Screenshots
![Orizn Start Screen](http://cl.ly/image/101k3g43100X/orizn_start_screen.jpg)

![Orizn in Game Screen](http://cl.ly/image/200z3V3d092H/orizn_in_game_1.jpg)

![Another Orizn in Game Screen](http://cl.ly/image/1e3W14163f0u/orizn_in_game_2.jpg)

![Orizn Game Over Screen](http://cl.ly/image/3Z3O1C2y212H/orizn_game_over.jpg)

## Installation & Development

The development is based on [Ruby](https://www.ruby-lang.org) in Version >= 2.1.3 and the [Gosu Library](http://libgosu.org) in Version >= 0.8.5.

If Ruby and Gosu are installed, simply clone this repo and run orizn.rb

If Ruby or the Gosu Library are not installed, and you're using OS X you can follow the instructions below:

### Install Ruby on OS X

By default OS X has a Ruby Installation available. However it is recommended to let the system installation untouched and install a separte Ruby Build for Development.

The packet management software Homebrew for OS X offers a pleasant way to do this. To install Homebrew, follow the instructions on [brew.sh](http://brew.sh)

As soon as Homebrew is ready, [rbenv](https://github.com/sstephenson/rbenv) can be installed, which will help to maintain the new Ruby Environment.

~~~
brew install rbenv ruby-build
~~~

To initialize rbenv in a new Terminal Session add

~~~
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
~~~

to your .bash_profile file.

To show all available Ruby releases, enter:

~~~
rbenv install -l
~~~

And install the recent, stable Ruby *Major*.*Minor*.*Patch* build available (at this time, this is 2.2.0) and set it global.

~~~
rbenv install 2.2.0
rbenv global 2.2.0
~~~

### Install Gosu
Gosu 0.8.x+ relies on the SDL 2 library [1].

~~~
brew install sdl2 libogg libvorbis
gem install gosu
~~~

[1] For more information visit the [Gosu Wiki](https://github.com/jlnr/gosu/wiki)

## Credits
The media assets have been found on [OpenGameArt.org](http://opengameart.org).

### Spaceships

[Blue Fighter](http://opengameart.org/content/blue-fighter-spaceship) by [MillionthVector](http://millionthvector.blogspot.com)

[Drakir](http://opengameart.org/content/spaceships-drakir) by [C-Toy](http://c-toy.blogspot.com)

### Backgrounds

[Space Skyboxes](http://opengameart.org/content/space-skyboxes-1) by Westbeam

### Graphic Effects
[Power Glow & Bullet](http://opengameart.org/content/complete-spaceship-game-art-pack) by [UnLucky Studio](http://unluckystudio.com)

### Music Themes

Intro Scene: [Sci-fi Freak Out Ambiance](http://opengameart.org/content/sci-fi-freak-out-ambiance) by Philippe Groarke

Level Scene: [Through Space](http://opengameart.org/content/through-space) by maxstack

### Sound Effects
[63 Digital sound effects (lasers, phasers, space etc.)](http://opengameart.org/content/63-digital-sound-effects-lasers-phasers-space-etc) by [Kenney](www.kenney.nl)