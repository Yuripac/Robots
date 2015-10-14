class WorldObject

  @@objects = []

  def initialize
    @@objects << self
  end

  def delete
    @@objects.delete(self)
  end

  def self.objects
    @@objects
  end
end