class Bullet
  attr_reader :sample, :x, :y
  attr_accessor :shot
  
  def initialize(entity, window)
    @bullet_img = Gosu::Image.new(window, "media/gfx/bullet.png", false)
    @sample     = Gosu::Sample.new(window, "media/sfx/phaserDown3.mp3")
    @shot       = false
    @entity     = entity
    @x          = entity.x
    @y          = entity.y
  end
  
  def update
    if @entity.instance_of? Player
      if @shot
        @y -= 15
        if @y < 0
          @shot = false
        end
      else
        @x = @entity.x
        @y = @entity.y
      end
    else
      if @shot
        @y += 25
        if @y > 600
          @shot = false
        end
      else
        @x = @entity.x
        @y = @entity.y
      end
    end
  end
  
  def draw
    if @shot
      @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.5, 0.5)
    end
  end 
end