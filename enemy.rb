class Enemy
  attr_reader :x, :y, :health
  
  def initialize(window)
    @window = window
    @ship   = Gosu::Image.new(window, 'media/ships/enemy.png', false)
    @hit    = false
    @health = 2
    @x      = rand(@window.width)
    @x      = 770 if @x >= 770
    @x      = 30 if @x <= 30
    @y      = rand(-100..0)
  end
  
  def hit_by?(bullets)
    @hit    = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    
    if @hit and @bullet
      @health -= 1
      @bullet.shot = false
    end
  end
  
  def reset_position
    @x = rand(@window.width)
    @x = 770 if @x >= 770
    @x = 30 if @x <= 30
    @y = rand(-100..0)
  end
  
  def load_bullets(bullets)
    @bullets = bullets
  end
  
  def shoot
    bullet = @bullets.find { |bullet| not bullet.shot } 
    if bullet
      bullet.shot = true
      bullet.sample.play
    end
  end
  
  def update
    @y -= 3
    if @y > @window.width or @health == 0
     reset_position
     @health = 2
    end    
  end
    
  def draw
    @ship.draw_rot(@x, @y, ENEMY, 0, 0.5, 0.5, 0.5, 0.5)
  end
end