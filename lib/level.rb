class Level < Scene
  attr_reader :player, :gameover
  
  def initialize(window)
    super(window)
    @window     = window
    @background = Gosu::Image.new(window, 'media/backgrounds/game.png', true)
    @hud        = Gosu::Image.new(window, 'media/interface/hud.png', true)
    @score_bar  = Gosu::Image.new(window, 'media/interface/score_bar.png', true)
    @font       = Gosu::Font.new(window, @robotobold, 30)
    @bigfont    = Gosu::Font.new(window, @robotobold, 60)
    @song       = Gosu::Song.new(window, 'media/music/through_space.ogg')
    @score      = 0
    @player     = Player.new(window)
    @bullets    = Array.new(5) { PlayerBullet.new(@player, window) }
    @enemies    = Array.new(5) { Enemy.new(window, @player) } 
    @gameover   = false
    
    @player.warp(400, 500)
    @player.load_bullets(@bullets)
    
    @enemies.each { |enemy|
      enemy.bullets = Array.new(5) { EnemyBullet.new(enemy, window) } 
      enemy.load_bullets(enemy.bullets) 
    }  
  end
  
  def draw
    super
    
    if @enemies.empty? or @player.health == 0
      @bigfont.draw("GAME OVER", 240, 100, UI, 1.5, 1.0, 0xffbe973c)
      @score_bar.draw(0, 200, UI, 0.5, 0.5)
      @font.draw("SCORE", 290, 201, UI, 1.0, 1.0, 0xff000000)
      @font.draw("#{@score}", 470, 201, UI, 1.0, 1.0, 0xff000000)
      @font.draw("PRESS ENTER TO START AGAIN", 260, 320, UI, 1.0, 1.0, 0xffc5a352)
      @font.draw("PRESS 'M' TO GO TO THE START SCREEN", 220, 380, UI, 1.0, 1.0, 0xffecd298)
      @font.draw("PRESS ESC TO QUIT", 305, 440, UI, 1.0, 1.0, 0xffeadcbb)
    else
      @hud.draw(514, 19, UI, 0.5, 0.5)
      @font.draw("SCORE", 534, 15, UI, 1.0, 1.0, 0xffbe973c)
      @font.draw("#{@score}", 611, 15, UI, 0.9, 1.0, 0xffbe973c)
      @font.draw("HEALTH", 655, 15, UI, 1.0, 1.0, 0xffbe973c)
      @font.draw("#{@player.health}", 745, 15, UI, 0.9, 1.0, 0xffbe973c)
      
      @player.draw
      @bullets.each { |bullet| bullet.draw }
      
      @enemies.each do |enemy| 
        enemy.draw
        enemy.bullets.each { |bullet| bullet.draw }
      end
    end
  end
  
  def update
    super(0.2, 0.25)
    
    unless @enemies.empty? or @player.health == 0
      @player.update
      @bullets.each { |bullet| bullet.update }
      @player.touched_by? @enemies
      
      @enemies.each do |enemy|
        enemy.update
        enemy.bullets.each { |bullet| bullet.update }
        @player.hit_by? enemy.bullets
         
        if enemy.hit_by?(@bullets)
          @enemies.delete(enemy)
          @score += 1
        end
      
        if enemy.y > @window.width
          @enemies.delete(enemy)
          @score -=1
        end
        
        if (enemy.x - @player.x).abs < 150 and enemy.y >= -5
          enemy.shoot
        end
      end
    else
      @gameover = true
    end
  end
end