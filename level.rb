class Level < Scene
  def initialize(window)
    super(window)
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
  end
end