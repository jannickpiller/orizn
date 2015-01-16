class Level < Scene
  attr_reader :player, :gameover
  
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
    
    @enemies = Array.new(15) { Enemy.new(window) }
    @enemies.each do |enemy|
      @enemy_bullets = Array.new(5) { EnemyBullet.new(enemy, window) }
      enemy.load_bullets(@enemy_bullets)
    end
    @gameover = false
  end
  
  def draw
    super
    
    if @enemies.empty? or @player.health == 0
      @font.draw("Game Over", 360, 220, UI, 1.0, 1.0, 0xffFF0000)
      @font.draw("Your score is: #{@score}", 330, 250, UI, 1.0, 1.0, 0xffffffff)
      @font.draw("Press Enter to start again", 290, 310, UI, 1.0, 1.0, 0xff0066ff)
      @font.draw("Esc. to exit", 350, 340, UI, 1.0, 1.0, 0xffFF0000)
    else
      @font.draw("Score:  #{@score}", 5, 550, UI, 1.0, 1.0, 0xffafafaf)
      @font.draw("Health: #{@player.health}", 5, 570, UI, 1.0, 1.0, 0xffafafaf)
      @player.draw
      @bullets.each { |bullet| bullet.draw }
    
      @enemies.each { |enemy| enemy.draw }
      @enemy_bullets.each { |enemy_bullet| enemy_bullet.draw }
    end
  end
  
  def update
    super(0.2, 0.25)
    
    unless @enemies.empty? or @player.health == 0
      @player.update
      @bullets.each { |bullet| bullet.update }

      @enemies.each { |enemy| enemy.update }
      @enemy_bullets.each { |enemy_bullet| enemy_bullet.update }
      @enemies.each { |enemy| enemy.hit_by? @bullets }
      
      @player.touched_by? @enemies
    
      @enemies.each do |enemy| 
        
        if enemy.hit_by?(@bullets)
          @enemies.delete(enemy)
          @score += 1
        end
      
        if enemy.y > @window.height
          @enemies.delete(enemy)
          @score -=1
        end
        
        if enemy.x - @player.x < 10 and enemy.y < 10
          enemy.shoot
        end
        
      end
    else
      @gameover = true
    end
  end
end