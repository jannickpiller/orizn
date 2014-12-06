class Level < Scene
  attr_reader :player
  
  def initialize(window)
    super(window)
    
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @player = Player.new(window)
    @bullets = Array.new(5) { Bullet.new(@player, window) }
    @player.warp(400, 500)
    @player.load_bullets(@bullets)
    @enemy = Enemy.new(window)
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
  end
  
  def draw
    super
    
    @enemy.draw
    @player.draw
    @bullets.each { |bullet| bullet.draw }
  end
  
  def update
    super
    
    @player.update
    @enemy.update
    @bullets.each { |bullet| bullet.update }
    @enemy.hit_by?(@bullets)
  end
end