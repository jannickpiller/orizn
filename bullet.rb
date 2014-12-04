class Bullet
  attr_reader :sample
  attr_accessor :shooted
  
  def initialize(player, window)
    @bullet_img = Gosu::Image.new(window, "media/bullet.png", false)
    @sample = Gosu::Sample.new(window, "media/phaserDown3.mp3")
    @player = player
    @shooted = false
    @x = @player.x
    @y = @player.y
  end
  
  def update
    if @shooted == true and @y <= 0
      @y -= 20
    end
  end
  
  def draw
    @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.35, 0.35)
  end 
end