class Bullet
  attr_reader :sample, :x, :y
  
  def initialize(player, window)
    @player = player
    @window = window
    @x = @player.x
    @y = @player.y
    @bullet_img = Gosu::Image.new(@window, "media/bullet.png", true)
    @sample = Gosu::Sample.new(window, "media/phaserDown3.mp3")
  end
  
  def update
    if @player.shooting
      # @y -= 20
      @y -= 2
      if @y < 0
        @player.shooting = false
      end
    else
      @x = @player.x
      @y = @player.y
    end
  end
  
  def draw
    if @player.shooting
      @bullet_img.draw_rot(@x, @y, WEAPON, 0.5, 0.5, 0.4, 0.4)
      @sample.play(0.5)
    end
  end 
end