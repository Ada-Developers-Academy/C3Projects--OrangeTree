# ORANGE TREE - BREAKFAST
class OrangeTree
  attr_reader :height, :age, :orange_count, :death_age

  # creates new tree
  def initialize
    @height = 1   # ft
    @age = 0
    @orange_count = 0
    @death_age = (rand(90..110))   # random age between 90 - 110
    @max_height = 30
  end # ends initialize

  # grows oranges based on age
  def produces_oranges
    if @age < 6
      @orange_count = 0
    elsif (@age >= 6) && (@age < 20)
      @orange_count = rand(50..100)
    elsif (@age >= 20) && (@age < 40)
      @orange_court = rand(100..200)
    elsif (@age >= 40) && (@age < 60)
      @orange_count = rand(200..300)
    else
      @orange_count = rand(100..200)
    end
  end # ends produces_oranges

  # tree grows
  def increases_height
    if (@age <= 5)
      @height += 3
    elsif (@age <= 15)
      @height += 1
    elsif (@age <= 40) && (@height < @max_height)
      @height += 0.5
    end
  end # ends increases_height

  # increases height, age; changes orange count; possibly dies
  def one_year_passes
    increases_height   # increases height
    @age += 1   # increases age
    produces_oranges   # checks the number of oranges that grow according to age

    # checks for death_age
    if @age >= @death_age
      puts "Your tree has passed on. Goodbye tree."
      # CAN INCLUDE IS_DEAD? VARIABLE
    end
  end # ends one_year_passes

  # removes an orange from the tree
  def pick_an_orange
    @orange_count -= 1
    if @orange_count <= 0
      puts "Sorry, tree is empty! So sad."
    else
      puts "Delicious orange!"
    end
  end # ends pick_an_orange

end # ends class OrangeTree

#########################################################

# ORANGE TREE - LUNCH
class OrangeGrove
  attr_reader :tree_count

  # creates new grove
  def initialize
    @grove = []
    @grove.push(OrangeTree.new)
    @tree_count = @grove.length
    @total_oranges = 0
  end # ends initialize

  # returns tree count
  def trees_planted
    if @tree_count <= 10   # if less than 10 plant 1 - 2 trees
      @grove.push(OrangeTree.new)
      @tree_count = @grove.length   # counts the elements of grove array and sets it as tree_count
    elsif @tree_count <= 50   # if less than 50 plant 10 - 15 trees
      new_trees_planted = 0
      new_tree_total = rand(10..15)
      while new_trees_planted <= new_tree_total
        @grove.push(OrangeTree.new)
      end
      @tree_count = @grove.length
    else
      "Your grove is full."
    end
  end # ends tree_planted

  # advances all trees by one year
  def grove_one_year
    @grove.each do |tree|   # for each array element in grove make sure one year passes
      tree.one_year_passes
    end
    trees_planted
  end # ends grove_one_year

  # counts the oranges on ALL the trees
  def count_all_the_oranges
    @grove.each do |tree|
      @total_oranges += tree.orange_count
    end
    @total_oranges
  end
end # end of OrangeGrove
