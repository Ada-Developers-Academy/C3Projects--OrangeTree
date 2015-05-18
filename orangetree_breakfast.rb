class OrangeTree #
  attr_reader :age, :is_dead, :max_age, :height, :count
  def initialize
    @age = 0 # starting our age, height, and count at 0 when it first starts out
    @height = 0
    @orange_count = 0
    @max_age = 10
    @is_dead = false
  end

  def one_year_passes
    @age += 1 #increments the orange tree's age by one year
    @height += 4 # increments the tree's height by 4 units
    @orange_count = 0 # after every year, the count of oranges goes back to 0
    if age > max_age # when it surpasses being 10 years old, we make it die
      @is_dead = true
      puts "Your tree is dead."
    else # when the orange tree is 3 years old, it grows oranges
      grow_oranges #calling grow_oranges grows and counts the number of oranges
    end
  end

  def grow_oranges # method to grow & count the oranges on the tree
    if @age <= 6 && @age >= 3 # between the age of 3-6 years, it will grow a random amount of oranges
        @orange_count=rand(50..100)
    elsif @age <= @max_age && @age > 6 # from age 7-10, it will grow a higher # of oranges
      @orange_count=rand(100..300)
    end
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
  attr_reader :trees, :count, :age
  def initialize(trees)
    tree_array = []  # creating an array to hold each new tree
    (1..trees).each do |initialize| # runs through the block as many times as specified
      tree_instance = OrangeTree.new    # creates new tree
      tree_array.push(tree_instance)       # places new tree into the array
    end
    puts tree_array
    @trees = tree_array
    @orange_count = 0
  end

  def count_all_oranges
    @trees.each do |t|
      @orange_count += rand(50..100) # random number oranges per tree
  end
  puts @orange_count
  end

  def grow_grove
    @trees.each do |y|
      y.one_year_passes
    end
  end
end
