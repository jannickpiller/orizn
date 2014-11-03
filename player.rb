class Player
  def initialize(window)
    @ship = Gosu::Image.new(window, 'media/ship.png', false)
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
    @x = 610 if @x >= 610
  end
  
  def move_down
    @y += 10
    @y = 440 if @y >= 440
  end
  
  def move_up
    @y -= 10
    @y = 40 if @y <= 40
  end
  
  def draw
    @ship.draw_rot(@x, @y, 1, 0, 0.5, 0.5, 0.07, 0.075)
  end
end