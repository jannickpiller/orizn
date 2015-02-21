class Enemy
  attr_reader :x, :y
  
  def initialize(window)
    @window = window
    @ship = Gosu::Image.new(window, 'media/ships/enemy.png', false)
    @hit = false
    @health = 2
    @x = rand(@window.width)
    @x = 770 if @x >= 770
    @x = 30 if @x <= 30
    @y = rand(-2500..0)
  end
  
  def hit_by?(bullets)
    @hit = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    if @hit and @bullet
      @health -= 1
      @bullet.shot = false
      if @health == 0
        @health = 2
        reset_position
      end
    end
  end
  
  def reset_position
    @x = rand(@window.width)
    @x = 770 if @x >= 770
    @x = 30 if @x <= 30
    @y = rand(-500..0)
  end
  
  def update
    #if @health > 0
    @y += 3
    #if @y > @window.width or @health == 0
     # reset_position
    # end    
  end
    
  def draw
    @ship.draw_rot(@x, @y, ENEMY, 0, 0.5, 0.5, 0.5, 0.5)
  end
end