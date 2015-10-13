require './lib/world_objects.rb'
require './lib/robot.rb'
require './lib/screen.rb'
require './lib/engine.rb'

#TODO: Todos os objectos devem ser uma herança de WorldObject

10.times do |n|
  Robot.new(n)
end

screen = Screen.new(20, 10, WorldObjects.objects)

engine = Engine.new(WorldObjects.objects, screen)

engine.run