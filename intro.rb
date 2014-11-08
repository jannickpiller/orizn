class Intro < Scene
  attr_reader :sample, :song
  
  def initialize(window)
    super(window)
    @background = Gosu::Image.new(window, 'media/5bg.png', true)
    @song = Gosu::Song.new(window, 'media/sci_fi_freak_out.mp3')
    @player = nil
    
    vt323 = "media/VT323-Regular.ttf"
    @title = Gosu::Font.new(window, vt323, 60)
    @enter = Gosu::Font.new(window, vt323, 40)
    @made = Gosu::Font.new(window, vt323, 25)
    @gosu_logo = Gosu::Image.new(window, 'media/gosu_logo.png', false)
    @sample = Gosu::Sample.new(window, 'media/ambience-2.wav')
  end
  
  def draw
    super
    
    @title.draw("orizn:prototype", 245, 150, UI, 1.0, 1.0, 0xffffffee)
    @enter.draw("press enter", 325, 260, UI, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(700, 565, UI, 0.3, 0.3)
    @made.draw("made with", 610, 565, UI, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 565, UI, 1.0, 1.0, 0xff0066ff)
  end
  
  def update
    super(0.07, 0.22)
  end
end