require 'gosu'

require_relative 'lib/player'
require_relative 'lib/bullet'
require_relative 'lib/scene'
require_relative 'lib/intro'
require_relative 'lib/level'
require_relative 'lib/bullet'
require_relative 'lib/enemy'

require_relative 'modules/zorder'

include ZOrder

class Orizn < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "orizn:prototype"
    @level       = Intro.new(self)
    @start       = false
  end
  
  def update
    @level.update
  end
  
  def draw
    @level.draw
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    press_enter if id == Gosu::KbReturn
    
    if id == Gosu::KbM
      @level = Intro.new(self)
      @start = false
    end
    
    if @level.instance_of? Level
      @level.player.button_down(id)
    end
  end
  
  def press_enter
    if @start == false
      @level.song.stop
      @level.sample.play
      @level = Level.new(self)
    end
    
    if @level.gameover == true
      @level = Level.new(self)
    end
    
    @start = true
  end
end

Orizn.new.show