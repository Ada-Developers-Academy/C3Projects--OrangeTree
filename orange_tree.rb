class OrangeTree
  attr_reader :age, :is_alive, :orange_count, :height

  def initialize
    @height = 0
    @orange_count = 0
    @age = 0
    @is_alive = true
  end

  def one_year_passes
    if @age < 20 # tree dies at 21 years old
      @age += 1
      @height += 1.5

      if @age > 5
        # oranges of the past year fall off since @orange_count is reassigned
        # grows standard of 50 oranges
        # plus 10 oranges per year the tree has been fruitful (starting at age 6)

        @orange_count = 50 + (10 * (age - 6))
      end

      puts "The orange tree is #{@age} years old, #{@height} feet tall, and has #{@orange_count} oranges."
    else
      @is_alive = false
      @orange_count = 0
      @age = 20
      puts "This tree has died."
    end
  end

  def pick_an_orange
    if @orange_count == 0
      puts "Oops, sorry. The tree is bare."
    else
      @orange_count -= 1
      puts "Yum! Oranges are great for you!\nThere are #{@orange_count} oranges left."
    end
  end

  # create a new instance of `OrangeTree`
  # call this method on that instance
  def plant_on(grove)
    # `.add_tree` of `OrangeGrove` pushes the instance to its array `@trees`
    grove.add_tree(self)
  end
end

class OrangeGrove
  def initialize(num_of_trees)
    @trees = []
    @total_oranges = 0

    num_of_trees.times do
      @trees.push(OrangeTree.new)
    end
  end

  def one_year_passes
    @trees.each do |tree|
      tree.one_year_passes
    end
  end

  def count_all_the_oranges
    @trees.each do |tree|
      @total_oranges += tree.orange_count
    end

    puts "The orange grove has #{@total_oranges} oranges."
  end

  def add_tree(tree)
    @trees.push(tree)
  end
end
