class Entity
  attr_reader :x, :y
  
  def initialize(window)
    @window = window
    @x      = 0
    @y      = 0
  end
  
  def warp
    @x, @y = 0, 0
  end
  
  def load_bullets(bullets)
    @bullets = bullets
  end
  
  def hit_by?(bullets)
    @hit = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    if @hit and @bullet
      @health -= 1
      @bullet.shot = false
    end
  end
  
  def shoot
    bullet = @bullets.find { |bullet| not bullet.shot } 
    if bullet
      bullet.shot = true
      bullet.sample.play
    end
  end
  
  def draw
    @ship.draw_rot(@x, @y, ENTITY, 0, 0.5, 0.5, 0.5, 0.5)
  end
end