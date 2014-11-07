class Scene
  def initialize(window)
    @player = Player.new(window)
    @player.warp(400, 500)
    @x = 0
    @y = -1448
  end
  
  def draw
    @background.draw(@x, @y, 0) if @background.nil? == false
    @song.play if @song.nil? == false
    @player.draw if @player.nil? == false
  end
  
  def update(scrollspeed_x = 0.07, scrollspeed_y = 0.15)
    if @background.nil? == false
      @x -= scrollspeed_x
      @y += scrollspeed_y
      @x = -1248 if @x < -1248
      @y = 0 if @y >= 0
    end
    
    @player.update if @player.nil? == false
  end  
end