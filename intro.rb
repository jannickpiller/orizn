class Intro
  attr_reader :sample, :song
  
  def initialize(window)
    @background = Gosu::Image.new(window, 'media/5bg.png', true)
    @x = 0
    @y = -1448
    @song = Gosu::Song.new(window, 'media/sci_fi_freak_out.mp3')
    
    vt323 = "media/VT323-Regular.ttf"
    @title = Gosu::Font.new(window, vt323, 60)
    @enter = Gosu::Font.new(window, vt323, 40)
    @made = Gosu::Font.new(window, vt323, 25)
    @gosu_logo = Gosu::Image.new(window, 'media/gosu_logo.png', false)
    @sample = Gosu::Sample.new(window, 'media/ambience-2.wav')
  end
  
  def draw
    @background.draw(@x, @y, 0)
    @title.draw("orizn:prototype", 245, 150, 1, 1.0, 1.0, 0xffffffee)
    @enter.draw("press enter", 325, 260, 1, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(700, 565, 0, 0.3, 0.3)
    @made.draw("made with", 610, 565, 1, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 565, 1, 1.0, 1.0, 0xff0066ff)
    @song.play
  end
  
  def update
    @y += 0.22
    @x -= 0.07
    @y = 0 if @y >= 0
    @x = -1248 if @x < -1248
  end
end