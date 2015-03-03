class EnemyBullet < Bullet
  def initialize(entity, window)
    super(entity, window)
    @bullet_img = Gosu::Image.new(window, "media/gfx/bullet.png", false)
    @sample     = Gosu::Sample.new(window, "media/sfx/phaserDown3.mp3")
    @speed      = 25
  end
end