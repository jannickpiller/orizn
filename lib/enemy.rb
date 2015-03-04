class Enemy < Entity
  attr_reader :shot
  attr_accessor :bullets, :health
  
  def initialize(window, player)
    super(window)
    @ship    = Gosu::Image.new(window, 'media/ships/enemy.png', false)
    @hit     = false
    @health  = 2
    @player  = player
    @delay   = 0
    @bullets = []
  end
  
  def warp
    @x       = rand(@window.width)
    @x       = 770 if @x >= 770
    @x       = 30 if @x <= 30
    @y       = rand(-3000..0)
  end
  
  def hit_by?(bullets)
    @hit = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    if @hit and @bullet
      @health -= 1
      @bullet.shot = false
      if @health == 0
        @health = 2
        warp
      end
    end
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
    @delay -= 1
    @y += 3
    if @x < @player.x
      @x += 0.45
    else
      @x -= 0.45
    end  
  end
end