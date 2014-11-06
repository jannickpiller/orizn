class Scene
  def initialize(window)
    @x = 0
    @y = -1448
  end
  
  def draw
  end
  
  def update
    @y += 0.22
    @x -= 0.07
    @y = 0 if @y >= 0
    @x = -1248 if @x < -1248
  end  
end