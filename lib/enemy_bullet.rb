class EnemyBullet < Bullet
  def initialize(entity, window)
    super(entity, window)
    @bullet_img = Gosu::Image.new(window, "media/gfx/enemy_bullet.png", false)
    @sample     = Gosu::Sample.new(window, "media/sfx/phaserUp4.mp3")
    @speed      = 40
  end
end