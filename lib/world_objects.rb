require './lib/robot.rb'
#Singleton
#Observer

class WorldObjects
  @@objects = []

  def self.new
    nil
  end

  def self.update(updated_objects)
    # Takes all the objects that has same type of updated_objects
    # And checks if needs to delete a object or add a object
    type = updated_objects.first.class
    objects = @@objects.select do |obj|
      obj.is_a?(type)
    end

    if objects.size < updated_objects.size
      @@objects.concat(updated_objects - objects)
    elsif objects.size > updated_objects.size
      #@@objects -= objects - updated_objects # It's is not working don't know why
      obj = (objects - updated_objects).first
      @@objects.delete(obj)
      puts @@objects
    end
  end

  def self.objects
    @@objects
  end

  Robot.add_observer(self)
end