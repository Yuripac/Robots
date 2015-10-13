class Engine

  def initialize(runnable_objects = [], screen)
    @runnable_objects = runnable_objects
    @screen = screen
  end

  def init
    @runnable_objects.each do |object|
      object.init
    end
  end

  def run
    init

    loop do
      @runnable_objects.each do |object|
        object.run
      end

      @screen.run
      sleep(1)
    end
  end

end