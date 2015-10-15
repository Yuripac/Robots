require './lib/world_object'
require './lib/robot.rb'
require './lib/screen.rb'
require './lib/engine.rb'

#TODO: Todos os objectos devem ser uma herança de WorldObject

50.times do |n|
  Robot.new(n)
end

screen = Screen.new(80, 40, WorldObject.objects[:all])

engine = Engine.new(WorldObject.objects[:all], screen)

engine.run