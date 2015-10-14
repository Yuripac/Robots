require "./lib/drawable.rb"
require "./lib/runnable.rb"
require "./lib/world_object.rb"
require "observer"

class Robot < WorldObject
  @@states = {
    hunting: 1,
    resting: 2
  }

  attr_accessor :id, :state, :score

  include Drawable, Runnable

  def initialize(id)
    super()
    @id = id
    @score = 1
    @state = @@states[:hunting]
  end

  # Overrides the Runnable's method
  # Engine will runs that
  def run
    move
    check_must_attack
  end

  # Overrides the Drawable's method
  # The number that represents the robot
  def draw()
    "#{score}"
  end

  # The robot movimentation
  def move
    move = rand(-1..1)

    case move
    when 0
      self.x += rand(-1..1)
      @state = @@states[:hunting]
    when 1
      self.y += rand(-1..1)
      @state = @@states[:hunting]
    else
      @state = @@states[:resting]
    end
  end

  def same_position?(robot)
    x == robot.x and y == robot.y
  end

  # Checks if must atack the other robots
  def check_must_attack
    # Take all robots
    robots = WorldObject.objects.select {|obj| obj.is_a?(Robot)}

    robots.each do |robot_defenser|
      if self.same_position?(robot_defenser) and self != robot_defenser
        self.attack(robot_defenser)
      end
    end
  end

  # Robot kills a robot and add his score
  def attack(robot)
    if(robot.state == Robot.states[:resting])
      @score += robot.score
      robot.die
      return true
    end
    return false
  end

  # Robot is "destroyed"
  def die
    delete
  end

  # Class's attributes

  def self.states
    @@states
  end
end