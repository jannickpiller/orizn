require 'gosu'

require_relative 'player'

class Orizn < Gosu::Window
  
  def initialize
    super(800, 600, false)
    self.caption = "orizn:prototype"
    @start = false
    
    vt323 = "media/VT323-Regular.ttf"
    @title = Gosu::Font.new(self, vt323, 60)
    @enter = Gosu::Font.new(self, vt323, 40)
    @made = Gosu::Font.new(self, vt323, 25)
    
    @gosu_logo = Gosu::Image.new(self, 'media/gosu_logo.png', false)
    @background = Gosu::Image.new(self, 'media/background.png', true) 
    
    @bggame = Gosu::Image.new(self, 'media/background_game.png', true)
    @player = Player.new(self)
    @player.warp(400, 540)
  end
  
  def update
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
    @background.draw(0, 0, 0)
    @title.draw("orizn:prototype", 245, 150, 1, 1.0, 1.0, 0xffffffee)
    @enter.draw("press enter", 325, 260, 1, 1.0, 1.0, 0xffffffee)
    @gosu_logo.draw(700, 565, 0, 0.3, 0.3)
    @made.draw("made with", 610, 565, 1, 1.0, 1.0, 0xffffffee)
    @made.draw("@jpilr", 10, 565, 1, 1.0, 1.0, 0xff0066ff)
  end
  
  def draw_game
    @bggame.draw(0, 0, 0)
    @player.draw
  end
end

Orizn.new.show