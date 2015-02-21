class Intro < Scene
  attr_reader :sample, :song
  
  def initialize(window)
    super(window)
    @background   = Gosu::Image.new(window, 'media/backgrounds/intro.png', true)
    @song         = Gosu::Song.new(window, 'media/music/sci_fi_freak_out.mp3')
    @press_enter  = Gosu::Font.new(window, @robotobold, 27)
    @logo         = Gosu::Image.new(window, 'media/interface/logo.png', false)
    @sample       = Gosu::Sample.new(window, 'media/sfx/ambience-2.wav')
  end
  
  def draw
    super
    @logo.draw(269, 88, UI, 0.5, 0.5)
    @press_enter.draw("PRESS ENTER", 345, 405, UI, 1.0, 1.0, 0xffffffff)
  end
  
  def update
    super(0.07, 0.22)
  end
end