require './lib/world_object'
require './lib/robot.rb'
require './lib/screen.rb'
require './lib/engine.rb'

#TODO: Todos os objectos devem ser uma herança de WorldObject

10.times do |n|
  Robot.new(n)
end

screen = Screen.new(20, 10, WorldObject.objects)

engine = Engine.new(WorldObject.objects, screen)

engine.run