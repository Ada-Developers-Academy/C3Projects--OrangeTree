#defining our Orange Tree Class
class OrangeTree
  #assigning read/write abilities to all of the attributes
  attr_reader :age, :is_dead, :max_age, :height, :count

  def initialize
    @age = 0
    @height = 0
    @count = 0
    @max_age = 10
    @is_dead = false
  end

  def one_year_passes
    @age += 1
    @height += 4
    @count = 0
    grow_oranges
    if @age > @max_age
      @is_dead = true
      @count = 0
      puts "Your tree is dead."
    end
  end

  def grow_oranges

    if @age <= 6 && @age >= 3
      @count=rand(50..100)
    elsif @age < @max_age && @age > 6
      @count=rand(100..300)
    end
  end

  def pick_orange
    if @count > 0
      @count -= 1
      puts "Nom, nom, om. This orange is so good!"
    else
      puts "There are no more oranges to be picked."
    end
  end
end
#####SILVER#####
class OrangeGrove
  attr_reader :trees, :count, :age

  #initializing the instance
  def initialize(trees)
    #creating an array to hold each new tree
    tree_array = []
    #runs through the block as many times as specified in the trees variable
    trees.times do |initialize|
      #creates a new tree
      tree_instance = OrangeTree.new
      #places the new tree into the array
      tree_array.push(tree_instance)
    end
    puts tree_array
    @trees = tree_array
  end

  #def count_all_oranges
  #  puts @orange_count
  #end

  def grow_grove
    @trees.each do |y|
      y.one_year_passes
    end
  end
end
