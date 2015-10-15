class WorldObject

  @@objects = {all: []}

  def initialize
    @@objects[:all] << self

    @@objects[obj_class.to_sym] ||= []
    @@objects[obj_class.to_sym] << self
  end

  def delete
    @@objects[:all].delete(self)

    @@objects[obj_class.to_sym].delete(self)
  end

  def self.objects
    @@objects
  end

  private

  def obj_class
    self.class.to_s.downcase
  end
end