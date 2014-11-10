class Player
  attr_reader :shooting, :x, :y
  
  def initialize(window)
    @window = window
    @ship = Gosu::Image.new(window, 'media/ship.png', false)
    @energy = Gosu::Image.new(window, 'media/glow.png', false)
    @bullets = Array.new
    @shooting = false
    @x = 0
    @y = 0
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
    @bullets.push(Bullet.new(self, @window))
    @shooting = true
    @bullets.each { |bullet| bullet.sample.play(0.1) }
  end
  
  def draw
    @ship.draw_rot(@x, @y, PLAYER, 0, 0.5, 0.5, 0.08, 0.08)
    @energy.draw_rot(@x, @y+10, BGFX, 0.5, 0.5, 0.4, 0.4)
    @bullets.each { |bullet| bullet.draw }
  end
  
  def update
    move_left if @window.button_down? Gosu::KbLeft
    move_right if @window.button_down? Gosu::KbRight
    move_down if @window.button_down? Gosu::KbDown
    move_up if @window.button_down? Gosu::KbUp
    shoot if @window.button_down? Gosu::KbSpace
    @bullets.each { |bullet| bullet.update }
  end
end