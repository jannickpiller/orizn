class Bullet
  attr_reader :sample, :x, :y
  attr_accessor :shot
  
  def initialize(entity, window)
    @bullet_img = Gosu::Image.new(window, "media/bullet.png", false)
    @sample = Gosu::Sample.new(window, "media/phaserDown3.mp3")
    @shot = false
    @entity = entity
    @x = @entity.x
    @y = @entity.y
  end
  
  def update
    if @shot
      @y -= 15
      if @y < 0
        @shot = false
      end
    else
      @x = @entity.x
      @y = @entity.y
    end
  end
  
  def draw
    if @shot
      @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.35, 0.35)
    end
  end 
end