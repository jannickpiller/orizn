require 'gosu'

require_relative 'player'

class Orizn < Gosu::Window
  
  def initialize
    super(640, 480, false)
    self.caption = "orizn:prototype"
    @start = false
    
    vt323 = "media/VT323-Regular.ttf"
    @title = Gosu::Font.new(self, vt323, 60)
    @enter = Gosu::Font.new(self, vt323, 40)
    @made = Gosu::Font.new(self, vt323, 25)
    
    @gosu_logo = Gosu::Image.new(self, 'media/gosu_logo.png', false)
    
    @player = Player.new(self)
    @player.warp(320, 240)
  end
  
  def update
    # game logic
    @player.move_left if button_down? Gosu::KbLeft
    @player.move_right if button_down? Gosu::KbRight
    @player.move_down if button_down? Gosu::KbDown
    @player.move_up if button_down? Gosu::KbUp
  end
  
  def draw
    if @start == false
      draw_start_screen
    else
      draw_game
    end
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    press_enter if id == Gosu::KbReturn
  end
  
  def press_enter
    @start = true
  end
  
  def draw_start_screen
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, -Float::INFINITY)
    @title.draw("orizn:prototype", 170, 150, 1, 1.0, 1.0, 0xffffffee)
    @enter.draw("press enter", 245, 260, 1, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(535, 440, 0, 0.3, 0.3)
    @made.draw("made with", 445, 440, 1, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 440, 1, 1.0, 1.0, 0xffffffee)
  end
  
  def draw_game
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, -Float::INFINITY)
    @player.draw
  end
end

Orizn.new.show