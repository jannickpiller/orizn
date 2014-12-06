class Enemy
  attr_reader :x, :y
  
  def initialize(window)
    @window = window
    @ship = Gosu::Image.new(window, 'media/enemy.png', false)
    @hit = false
    @health = 2
    @x = rand(@window.width)
    @x = 770 if @x >= 770
    @x = 30 if @x <= 30
    @y = 0
  end
  
  def hit_by?(bullets)
    @hit = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    if @hit and @bullet
      @health -= 1
      @bullet.shot = false
      if @health == 0
        @health = 2
        @y = 0
        @x = rand(@window.width)
        @x = 770 if @x >= 770
        @x = 30 if @x <= 30
      end
    end
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