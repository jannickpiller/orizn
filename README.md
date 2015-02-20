![orizn prototype logo title](http://cl.ly/image/3g0d3J3B3w1q/orizn-logo.png)

orizn is a minimal game prototype written in Ruby using the Gosu Framework. The main features are:

* Ability to load different scenes
* Simple, memory friendly particle engine to shoot bullets
* Simple Collision Detection using features provided with the Gosu Framework
* Scrolling Background
* Basic Score and Game Over Rules

The goal of this project was not to come up with a polished game, but with a prototype to learn from. The code base is in its current form not clean yet. So besides more features to implement, code organization and proper use of Object Oriented Programming principlies are on the to do list.

## Screenshots

![Screenshot that shows a blue jet shooting at a black red enemy in space] (http://f.cl.ly/items/2m1T0p1z3o2f43220q2p/orizn_2013-12-08.jpg)

![Screenshot that shows 5 enemies on the screen](http://f.cl.ly/items/2u29442d1b13343h0k0f/orizn_2014-12-10.jpg)

## Installation & Development

To develope this game I have used [Ruby](https://www.ruby-lang.org) in Version >= 2.1.3 and the [Gosu Library](http://libgosu.org) in Version >= 0.8.5.

If you have installed Ruby and Gosu on your machine, simply clone this repo and run orizn.rb

### Clone the Repo

To clone this repo (for example to your Desktop)

~~~
cd ~/Desktop
git clone https://github.com/jpilr/orizn.git
~~~

### Run orizn.rb

~~~
cd orizn
ruby orizn.rb
~~~

If you have not installed Ruby or the Gosu Library, and you're using OS X please follow the instructions below:

### Install Ruby on OS X

By default OS X has a Ruby Installation avaiable. However it is better to let the system installation untouched and install a separte Ruby Build for Development.

To do this, the packet management software Homebrew for OS X is necessary. Please install it, following the instructions on [brew.sh](http://brew.sh)

As soon as Homebrew is ready, it is time to install [rbenv](https://github.com/sstephenson/rbenv), which will help to maintain the new Ruby Environment.

~~~
brew install rbenv ruby-build
~~~

To initialize rbenv in a new Terminal Session add

~~~
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
~~~

to your .bash_profile file.

To show all avaiable Ruby releases, enter:

~~~
rbenv install -l
~~~

And install the recent, stable Ruby *Major*.*Minor*.*Patch* build (at this time, this is 2.2.0) and set it global.

~~~
rbenv install 2.2.0
rbenv global 2.2.0
~~~

### Install Gosu

~~~
gem install gosu
~~~

## Credits
This project is all about coding and the Gosu Framework. So I decided to use [OpenGameArt.org](http://opengameart.org) as a resource for the assets.

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
Shooting (phaserDown3.mp3): [63 Digital sound effects (lasers, phasers, space etc.)](http://opengameart.org/content/63-digital-sound-effects-lasers-phasers-space-etc) by [Kenney](www.kenney.nl)