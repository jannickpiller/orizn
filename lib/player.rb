class Player
  attr_reader :x, :y, :health
  
  def initialize(window)
    @window = window
    @ship   = Gosu::Image.new(window, 'media/ships/player.png', false)
    @energy = Gosu::Image.new(window, 'media/gfx/glow.png', false)
    @health = 100
    @x      = 0
    @y      = 0
  end
  
  def warp(x, y)
    @x, @y = x, y
  end
  
  def load_bullets(bullets)
    @bullets = bullets
  end
  
  def hit_by?(bullets)
    @hit = bullets.any? { |bullet| Gosu::distance(bullet.x, bullet.y, @x, @y) < 30 }
    @bullet = bullets.find { |bullet| bullet.shot }
    if @hit and @bullet
      @health -= 10
      @bullet.shot = false
    end
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
  
  def shoot
    bullet = @bullets.find { |bullet| not bullet.shot } 
    if bullet
      bullet.shot = true
      bullet.sample.play
    end
  end
  
  def touched_by?(enemies)
    @touched = enemies.any? { |enemy| Gosu::distance(enemy.x, enemy.y, @x, @y) < 15 }
    if @touched
      @health -= 1
    end
  end
  
  def button_down(id)
    shoot if id == Gosu::KbSpace
  end
  
  def draw
    @ship.draw_rot(@x, @y, PLAYER, 0, 0.5, 0.5, 0.5, 0.5)
    @energy.draw_rot(@x, @y+10, BGFX, 0.5, 0.5, 0.4, 0.4)
  end
  
  def update
    move_left   if @window.button_down? Gosu::KbLeft
    move_right  if @window.button_down? Gosu::KbRight
    move_down   if @window.button_down? Gosu::KbDown
    move_up     if @window.button_down? Gosu::KbUp
  end
end