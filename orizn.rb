require 'gosu'

require_relative 'game_window'

class Orizn < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "orizn:prototype"
    
    @title = Gosu::Font.new(self, "media/VT323-Regular.ttf", 60)
    @start = Gosu::Font.new(self, "media/VT323-Regular.ttf", 40)
    @made = Gosu::Font.new(self, "media/VT323-Regular.ttf", 25)
    @gosu_logo = Gosu::Image.new(self, 'media/gosu_logo.png', true)
  end
  
  def draw
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, -Float::INFINITY)
    @title.draw("orizn:prototype", 170, 150, 1, 1.0, 1.0, 0xffffffee)
    @start.draw("press enter", 245, 260, 1, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(535, 440, 0, 0.3, 0.3)
    @made.draw("made with", 445, 440, 1, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 440, 1, 1.0, 1.0, 0xffffffee)
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    start if id == Gosu::KbReturn
  end
  
  def start
    GameWindow.new.show
    close
  end
end

Orizn.new.show