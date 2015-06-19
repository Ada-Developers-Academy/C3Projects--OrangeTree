#Orange Tree Group Project - Corinne, Michelle, and Loraine

#Creates the class for a single tree
class OrangeTree
  #Makes height, age, and life visible (but not editable)
  attr_reader :height, :age, :life

  #Blueprint for new trees
  def initialize()
    @height = 1
    @age = 0
    @orange_count = 0
    @life = true
  end

  #Check the orange count (longform way)
  def count_the_oranges
    return @orange_count
  end

  #Picks an orange, decreases total by 1 unless there are no more oranges
  def pick_an_orange
    if @orange_count > 0
      @orange_count -= 1
      puts "Yummm! How delicious!"
    elsif @orange_count == 0
      puts "There are no oranges left to pick. Sorry!"
    end
  end

  # Age the tree a year, increase height, and increase fruit yield
  def one_year_passes
    if @life == true
      @height+=1
      @age+=1
      if @age >= 3 && @age < 5
        @orange_count = 20
      elsif @age >= 5 && @age < 7
        @orange_count = 30
      elsif @age == 7
        @life = false
        @orange_count = 0
        puts "The tree has died."
      end
    elsif @life == false
      puts "Plant a tree. This one's dead. \:\("
    end
  end
end

# Creates a class for a grove
class OrangeGrove
attr_reader :total_oranges
attr_reader :soil_quality

  # Scales the grove to the user's tree count
  def initialize (tree_count)
    @existing_trees = []
    tree_count.times do
        @existing_trees.push(OrangeTree.new)
    end
        #Conditional defines soil quality based on # of trees
        if tree_count >= 1 && tree_count <= 15
          @soil_quality = "good"
        elsif tree_count >= 16 && tree_count <= 25
          @soil_quality = "fair"
        elsif tree_count >= 26 && tree_count <= 30
          @soil_quality = "poor"
        else tree_count > 30
          @soil_quality = "unusable"
        end
  end

  # Ages the trees
  def one_year_passes
    @existing_trees.each do |trees|
      trees.one_year_passes
    end
  end

  # Allows the user to check total orange quantity
  def count_all_the_oranges
  @total_oranges = 0
    @existing_trees.each do |trees|
      @total_oranges += trees.count_the_oranges
    end
  return @total_oranges
  end
end
