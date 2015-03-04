class Player < Entity
  attr_reader :health
  
  def initialize(window)
    super(window)
    @ship   = Gosu::Image.new(window, 'media/ships/player.png', false)
    @energy = Gosu::Image.new(window, 'media/gfx/glow.png', false)
    @health = 10
  end
  
  def warp
    @x = 400
    @y = 500
  end
  
  def touched_by?(enemies)
    @touched = enemies.any? { |enemy| Gosu::distance(enemy.x, enemy.y, @x, @y) < 10 }
    @enemy = enemies.find { |enemy| Gosu::distance(enemy.x, enemy.y, @x, @y) < 10 }
    if @touched
      @health -= 1
      enemies.delete(@enemy)
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
  
  def button_down(id)
    shoot if id == Gosu::KbSpace
  end
  
  def draw
    super
    @energy.draw_rot(@x, @y+10, BGFX, 0.5, 0.5, 0.4, 0.4)
  end
  
  def update
    move_left   if @window.button_down? Gosu::KbLeft
    move_right  if @window.button_down? Gosu::KbRight
    move_down   if @window.button_down? Gosu::KbDown
    move_up     if @window.button_down? Gosu::KbUp
  end
end