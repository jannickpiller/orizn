class Scene
  def initialize(window)
    @x = 0
    @y = -1448
    @vt323 = "media/VT323-Regular.ttf"
    @robotobold = "media/Roboto-Bold.ttf"
  end
  
  def draw
    @background.draw(@x, @y, BACKGROUND) if @background.nil? == false
    @song.play if @song.nil? == false
  end
  
  def update(scrollspeed_x = 0.07, scrollspeed_y = 0.15)
    if @background.nil? == false
      @x -= scrollspeed_x
      @y += scrollspeed_y
      @x = -1248 if @x < -1248
      @y = 0 if @y >= 0
    end
  end  
end