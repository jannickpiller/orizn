require 'gosu'

class Orizn < Gosu::Window
  @@start = false
  
  def initialize
    super(640, 480, false)
    self.caption = "orizn:prototype"
    
    vt323 = "media/VT323-Regular.ttf"
    @title = Gosu::Font.new(self, vt323, 60)
    @start = Gosu::Font.new(self, vt323, 40)
    @made = Gosu::Font.new(self, vt323, 25)
    
    @gosu_logo = Gosu::Image.new(self, 'media/gosu_logo.png', true)
  end
  
  def update
    # game logic
  end
  
  def draw
    if @@start == false
      draw_start_screen
    else
      draw_game
    end
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    toggle_start if id == Gosu::KbReturn
  end
  
  def toggle_start
    @@start = true
  end
  
  def draw_start_screen
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, -Float::INFINITY)
    @title.draw("orizn:prototype", 170, 150, 1, 1.0, 1.0, 0xffffffee)
    @start.draw("press enter", 245, 260, 1, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(535, 440, 0, 0.3, 0.3)
    @made.draw("made with", 445, 440, 1, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 440, 1, 1.0, 1.0, 0xffffffee)
  end
  
  def draw_game
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, -Float::INFINITY)
  end
end

Orizn.new.show