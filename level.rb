class Level < Scene
  attr_reader :player
  
  def initialize(window)
    super(window)
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
    @score = Gosu::Font.new(window, @vt323, 20)
    
    @player = Player.new(window)
    @player.warp(400, 500)

    @bullets = Array.new(5) { Bullet.new(@player, window) }
    @player.load_bullets(@bullets)
    
    @enemies = Array.new(25) { Enemy.new(window) }
  end
  
  def draw
    super
    
    @player.draw
    @bullets.each { |bullet| bullet.draw }
    
    @enemies.each { |enemy| enemy.draw }
  end
  
  def update
    super(0.2, 0.25)
    
    @player.update
    @bullets.each { |bullet| bullet.update }

    @enemies.each { |enemy| enemy.update }
    @enemies.each { |enemy| enemy.hit_by? @bullets }
    
    # @enemies.each do |enemy| 
      # if enemy.hit_by?(@bullets)
        # @enemies.delete(enemy)
        # end
    # end
  end
end