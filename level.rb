class Level < Scene
  attr_reader :player
  
  def initialize(window)
    super(window)
    @window = window
    @background = Gosu::Image.new(window, 'media/5.png', true)
    @song = Gosu::Song.new(window, 'media/through_space.ogg')
    @score = 0
    @font = Gosu::Font.new(window, @vt323, 25)
    
    @player = Player.new(window)
    @player.warp(400, 500)

    @bullets = Array.new(5) { Bullet.new(@player, window) }
    @player.load_bullets(@bullets)
    
    @enemies = Array.new(25) { Enemy.new(window) }
  end
  
  def draw
    super
    
    if @enemies.empty?
      @font.draw("Game Over", 360, 250, UI, 1.0, 1.0, 0xffFF0000)
      @font.draw("Your score is: #{@score}", 330, 280, UI, 1.0, 1.0, 0xffffffff)
    else
      @font.draw("Score: #{@score}", 710, 5, UI, 1.0, 1.0, 0xffffffff)
      @player.draw
      @bullets.each { |bullet| bullet.draw }
    
      @enemies.each { |enemy| enemy.draw }
    end
  end
  
  def update
    super(0.2, 0.25)
    
    @player.update
    @bullets.each { |bullet| bullet.update }

    @enemies.each { |enemy| enemy.update }
    @enemies.each { |enemy| enemy.hit_by? @bullets }
    
    @enemies.each do |enemy| 
      if enemy.hit_by?(@bullets)
        @enemies.delete(enemy)
        @score += 1
      end
      
      if enemy.y > @window.width
        @enemies.delete(enemy)
        @score -=1
      end
    end
  end
end