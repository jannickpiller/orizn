class Enemy
  attr_reader :x, :y
  
  def initialize(window)
    @window = window
    @ship = Gosu::Image.new(window, 'media/enemy.png', false)
    @alive = true
    @x = rand(@window.width)
    @x = 770 if @x >= 770
    @x = 30 if @x <= 30
    @y = 0
  end
  
  def update
    @y += 3
    if @y > @window.width
      @y = 0
      @x = rand(@window.width)
      @x = 770 if @x >= 770
      @x = 30 if @x <= 30    
    end
  end
    
  def draw
    @ship.draw_rot(@x, @y, ENEMY, 0, 0.5, 0.5, 0.8, 0.8)
  end
end