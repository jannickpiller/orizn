class Bullet
  attr_reader :sample, :x, :y
  attr_accessor :shot
  
  def initialize(entity, window)
    @shot       = false
    @entity     = entity
    @x          = entity.x
    @y          = entity.y
  end
  
  def update
    if @shot
      @y += @speed
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
      @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.5, 0.5)
    end
  end 
end