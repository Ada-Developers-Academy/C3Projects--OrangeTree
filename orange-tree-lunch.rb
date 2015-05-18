# Orange Tree Group Project - Loraine, Michelle, and Corinne!

class OrangeTree
  attr_reader :height, :age, :life

  def initialize()
    @height = 1 # trees are born at the height of 1 unit something
    @age = 0
    @orange_count = 0
    @life = true # life will return true as long as the tree is alive
  end

  def count_the_oranges
    return @orange_count
  end

  # Picks an orange off the tree (only if you have oranges on your tree!)
  def pick_an_orange
    if @orange_count > 0
      @orange_count -= 1
      puts "Yumm! How delicious!"
    elsif @orange_count == 0
      puts "There are no oranges left to pick. Sorry!"
    end
  end

  # If the tree is alive, we update the height, age, and orange count
  def one_year_passes
    if @life == true
      @height += 1
      @age += 1
      if @age >= 3 && @age <= 5 # orange count is different depending on the age
        @orange_count = 20
      elsif @age >= 5 && @age < 7
        @orange_count = 30
      elsif @age == 7 # orange tree dies at age 7, orange count is zero upon death
        @life = false
        @orange_count = 0
        puts "The tree has died."
      end
    elsif @life == false # tree does not age/grow/grow oranges once it dies
      puts "Plant a tree. This one's dead. :\("
    end
  end
end

class OrangeGrove
  attr_reader :total_oranges

  # Orange Grove passes a parameter for number of trees in your grove
  def initialize(tree_count)
    @existing_trees = []
    tree_count.times do
      @existing_trees.push(OrangeTree.new)
    end
  end

  # Updates age, height, orange count for each tree in the grove
  def one_year_passes
    @existing_trees.each do |trees|
      trees.one_year_passes
    end
  end

  # Counts oranges for each tree and returns total oranges in grove
  def count_all_oranges
    @total_oranges = 0
    @existing_trees.each do |trees|
      @total_oranges += trees.count_the_oranges
    end
    return @total_oranges
  end

end
