class OrangeTree
  attr_reader :height, :age, :orange_count, :life

  def initialize()
    @height = 1
    @age = 0
    @orange_count = 0
    @life = true
  end

  def count_the_oranges
  return @orange_count
  end

  def pick_an_orange
    if @orange_count > 0 #you can only pick oranges if there are oranges
    @orange_count-=1
    puts "Yum! How delicious!"
  elsif @orange_count == 0
    puts "There are no oranges to pick, Sorry!"
    end
  end

  def one_year_passes
    if @life == true #until the age we determined as death
    @height+=1
    @age+=1
    if @age >= 3 && @age < 5
      @orange_count = 20
    elsif @age >= 5 && @age < 7 #as tree matures it produces more fruit
      @orange_count = 30
    elsif @age == 7
      @life = false
      @orange_count = 0 # if tree dies it will not produce fruit
      puts "The tree has died."
    end
  elsif @life == false
  puts "Plant a tree. This one's dead. \:\("
  # a message for if the user has tried to check value after tree death age
    end
  end
end

class OrangeGrove
attr_reader :total_oranges
attr_reader :soil_quality

def initialize(tree_count)
    @existing_trees = []
    tree_count.times do
    @existing_trees.push(OrangeTree.new)
  end
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


  def one_year_passes
    @existing_trees.each do |trees|
      trees.one_year_passes
    end
  end

  def count_all_oranges
  @total_oranges = 0
  @existing_trees.each do |trees|
      @total_oranges += trees.count_the_oranges
    end
    return total_oranges
  end
end
