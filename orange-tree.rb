# this one is another group project! three adies to a group. :)
# https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/orange_tree.md
# -------------------------------------

class OrangeTree
  attr_accessor :soil_quality
  attr_reader :age, :grove, :height, :orange_count

  # trees are young until they are over 3 years old.
  YOUNG = 3

  # trees grow faster when they are young.
  YOUNG_GROWTH = 3
  MATURE_GROWRTH = 0.5

  # trees grow oranges differently based on soil quality.
  HEALTHY_ORANGE_GROWTH_MULTIPLIER = 3
  AVERAGE_ORANGE_GROWTH_MULTIPLIER = 2
  UNHEALTHY_ORANGE_GROWTH_MULTIPLIER = 1

  # trees die at different ages based on soil quality.
  HEALTHY_DEATH_AGE = 10
  AVERAGE_DEATH_AGE = 8
  UNHEALTHY_DEATH_AGE = 5


  def initialize
    @age = 0
    @alive = true
    @height = 0
    @orange_count = 0
  end

  def grow_oranges
    if age >= YOUNG # oranges don't grow on young trees! those trees are focusing on growing tall!
      if soil_quality == "unhealthy"
        growth_multiplier = UNHEALTHY_ORANGE_GROWTH_MULTIPLIER
      elsif soil_quality == "average"
        growth_multiplier = AVERAGE_ORANGE_GROWTH_MULTIPLIER
      else # "healthy"
        growth_multiplier = HEALTHY_ORANGE_GROWTH_MULTIPLIER
      end

      @orange_count = age * growth_multiplier
    end
  end

  def grow_taller
    if age <= YOUNG
      @height += 3
    else
      @height += 0.5
    end
  end

  def kill_tree
    @alive = false
    @orange_count = 0
    @height = 1 # maybe they fall over & become nurse logs.
    puts "This tree has died."
  end

  def grow_older
    if (soil_quality == "unhealthy") && (age >= UNHEALTHY_DEATH_AGE)
      kill_tree
    elsif (soil_quality == "average") && (age >= AVERAGE_DEATH_AGE)
      kill_tree
    elsif age >= HEALTHY_DEATH_AGE
      kill_tree
    else
      @age += 1
    end
  end

  def one_year_passes
    if alive? && (age < HEALTHY_DEATH_AGE)
      grow_older
      grow_taller
      grow_oranges
    end
  end

  def pick_orange
    if orange_count > 0
      @orange_count -= 1
      puts "That was a very tasty orange!"
    else
      puts "There are no more oranges to pick this year."
    end
  end

  def plant_on(grove_name)
    @grove = grove_name

    grove.trees.push(self)
    grove.check_soil_quality
  end

  def alive?
    @alive == true
  end
end # class OrangeTree


class OrangeGrove
  attr_reader :count_all_the_oranges, :trees

  # setting the limits for soil quality.
  HEALTHY_LIMIT = 15 # anything less than or equal to the limit.
  AVERAGE_LIMIT = 30 # anything over the healthy limit but less than or equal to this average limit.
  # implied unhealthy: anything over average limit trees.

  def initialize
    @trees = []
    @soil_quality = "healthy"
  end

  def plant_trees(number)
    if (number.is_a? Integer) && (number > 0)
      number.times do
        @trees.push(OrangeTree.new)
      end

      check_soil_quality
    else
      puts "You can't plant #{ number } trees. Please try again with a number."
    end
  end

  def one_year_passes
    @count_all_the_oranges = 0
    trees.each do |tree|
      tree.one_year_passes
      @count_all_the_oranges += tree.orange_count
    end

    check_soil_quality
  end

  def check_soil_quality
    living_trees = 0
    trees.each { |tree| living_trees += 1 if tree.alive? }

    if living_trees <= HEALTHY_LIMIT
      current_quality = "healthy"
    elsif living_trees <= AVERAGE_LIMIT
      current_quality = "average"
    else
      current_quality = "unhealthy"
    end

    update_trees_soil_quality(current_quality)
  end

  def update_trees_soil_quality(new_soil_quality)
    @soil_quality = new_soil_quality

    trees.each do |tree|
      tree.soil_quality = new_soil_quality
    end
  end
end # class OrangeGrove
