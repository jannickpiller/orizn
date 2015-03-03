class Enemy
  attr_reader :x, :y, :shot
  attr_accessor :bullets
  
  def initialize(window, player)
    @window  = window
    @ship    = Gosu::Image.new(window, 'media/ships/enemy.png', false)
    @hit     = false
    @health  = 2
    @x       = rand(@window.width)
    @x       = 770 if @x >= 770
    @x       = 30 if @x <= 30
    @y       = rand(-2500..0)
    @player  = player
    @delay   = 0
    @init    = true
    @bullets = []
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
  
  def load_bullets(bullets)
    @bullets = bullets
  end
  
  def shoot
    return if @delay > 0
    bullet = @bullets.find { |bullet| not bullet.shot } 
    if bullet
      @delay = 30
      bullet.shot = true
      bullet.sample.play
    end
  end
  
  def update
    #if @health > 0
    @delay -= 1
    @y += 3
    #if @y > @window.width or @health == 0
     # reset_position
    # end
    # if @x < @player.x
      #@x += 1
      #else
      #@x -= 1
      #end  
  end
    
  def draw
    @ship.draw_rot(@x, @y, ENEMY, 0, 0.5, 0.5, 0.5, 0.5)
  end
end