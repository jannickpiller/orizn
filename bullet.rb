class Bullet
  attr_reader :sample
  attr_accessor :shot
  
  def initialize(player, window)
    @bullet_img = Gosu::Image.new(window, "media/bullet.png", false)
    @sample = Gosu::Sample.new(window, "media/phaserDown3.mp3")
    @player = player
    @shot = false
    @x = @player.x
    @y = @player.y
  end
  
  def update
    if @shot
      @y -= 15
      if @y < 0
        @shot = false
      end
    else
      @x = @player.x
      @y = @player.y
    end
  end
  
  def draw
    if @shot == true
      @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.35, 0.35)
    end
  end 
end