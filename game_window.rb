class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "orizn:prototype"
  end
  
  def update
    #game logic
  end
  
  def draw
    draw_quad(0, 0, 0xff000000, 0, 480, 0xff262626, 640, 0, 0xff000000, 640, 480, 0xff262626, 0)
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
  end
end