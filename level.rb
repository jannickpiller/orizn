class Level < Scene
  def initialize(window)
    super(window)
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
    @player = Player.new(window)
    @player.warp(400, 500)
  end
  
  def draw
    @background.draw(@x, @y, 0)
    @song.play
    @player.draw
  end
  
  def update
    @y += 0.15
    @x -= 0.07
    @y = 0 if @y >= 0
    @x = -1248 if @x < -1248
    
    @player.update
  end
end