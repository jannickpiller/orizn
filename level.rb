class Level
  def initialize(window)
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @x = 0
    @y = -1448
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
    @player = Player.new(window)
    @player.warp(400, 500)
  end
  
  def draw
    @background.draw(@x, @y, 0)
    @player.draw
    @song.play
  end
  
  def update
    @y += 0.15
    @x -= 0.07
    @y = 0 if @y >= 0
    @x = -1248 if @x < -1248
    
    @player.update
  end
end