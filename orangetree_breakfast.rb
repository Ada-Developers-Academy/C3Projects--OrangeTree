class OrangeTree #
  attr_reader :age, :height, :orange_count, :max_age, :is_dead
  def initialize
    @age = 0
    @height = 0
    @orange_count = 0
    @max_age = 10
    @is_dead = false
  end

  def one_year_passes
    @age += 1
    @height += 4
    @orange_count = 0 # after every year, the count of oranges goes back to 0
    if age > max_age
      @is_dead = true
      puts "Your tree is dead."
    else
      grow_oranges
    end
  end

  def grow_oranges # method to grow & count the oranges on the tree
    if @age <= 6 && @age >= 3 # between the age of 3-6 years, it will grow a random amount of oranges
      @orange_count=rand(50..100)
    elsif @age <= @max_age && @age > 6 # from age 7-10, it will grow a higher # of oranges
      @orange_count=rand(100..300)
    end
  end

  def orange_count
    return @orange_count
  end

  def pick_orange
    if @orange_count > 0 #if there are oranges to be picked, and we use the pick_orange method,
      @orange_count -= 1 # it will decrease the amount of oranges on the tree by 1
      puts "Nom, nom, nom. This orange is sooooo good!"
    else
      puts "There are no more oranges to be picked."
    end
  end
end

class OrangeGrove
  attr_reader :trees, :orange_count, :age

  def initialize(trees)
    tree_array = []
    (1..trees).each do  # runs through the block as many times as specified
      tree_instance = OrangeTree.new    # creates new tree
      tree_array.push(tree_instance)    # places new tree into the array
    end
    puts tree_array
    @trees = tree_array
    @orange_count = 0
  end

  def grow_grove
    @trees.each do |y|
      y.one_year_passes
    end
  end

  def count_all_oranges
    @trees.each do |x|
      @orange_count += x.orange_count
    end
    @orange_count
  end
end
