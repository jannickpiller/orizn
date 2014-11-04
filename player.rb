class Player
  def initialize(window)
    @ship = Gosu::Image.new(window, 'media/ship.png', false)
    @energy = Gosu::Image.new(window, 'media/glow.png', false)
    @x = @y = 0
  end
  
  def warp(x, y)
    @x, @y = x, y
  end
  
  def move_left
    @x -= 10
    @x = 30 if @x <= 30
  end
  
  def move_right
    @x += 10
    @x = 770 if @x >= 770
  end
  
  def move_down
    @y += 10
    @y = 560 if @y >= 560
  end
  
  def move_up
    @y -= 10
    @y = 40 if @y <= 40
  end
  
  def draw
    @ship.draw_rot(@x, @y, 1, 0, 0.5, 0.5, 0.08, 0.08)
    @energy.draw_rot(@x, @y+10, 2, 0.5, 0.5, 0.4, 0.4)
  end
end