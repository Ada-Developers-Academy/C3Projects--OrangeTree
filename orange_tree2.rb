class OrangeTree
  attr_reader :height, :age, :orange_count, :death_age

  # creates new tree
  def initialize
    @height = 1
    @age = 0
    @orange_count = 0
    #random age between 90-110
    @death_age = (rand(90..110))
    @max_height = 30
  end

  def increases_height
    #increases height according to age
    if (@age <= 5)
      @height += 3
      #puts "#{@height}"
    elsif (@age <= 15)
      @height += 1
    elsif (@age <= 40) && (@height < @max_height)
      @height += 0.5
    end
  end

  def produces_oranges
    #produces orange? according to age
    if (@age < 6)
      @orange_count = 0
    elsif (@age >= 6) && (@age < 20)
      @orange_count = (rand(50..100))
    elsif (@age >= 20) && (@age < 40)
      @orange_count = (rand(100..200))
    elsif (@age >= 40) && (@age < 60)
      @orange_count = (rand(200..300))
    else
      @orange_count = (rand(100..200))
    end
  end

  def one_year_passes
    #increases age by one year
    @age += 1
    increases_height
    produces_oranges
    #is alive?
    if (@age >= @death_age)
      puts "Tree has passed on. Good-bye, tree."
    end
  end

  def pick_an_orange
    @orange_count -= 1
    if (@orange_count <= 0)
      puts "Sorry, tree is empty!"
    else
      puts "Delicious orange!"
    end
    #reduces the orange count by 1
    #returns message about either quality of orange or quantity if there are none
  end #ends pick_an_orange

end

###########################################
#Orange Grove begins

class OrangeGrove
  attr_reader :tree_count

  def initialize
    @grove = []
    @grove.push(OrangeTree.new)
    @tree_count = @grove.length
    @total_oranges = 0
  end

  def trees_planted
    if @tree_count <= 10
        @grove.push(OrangeTree.new)
        @tree_count = @grove.length
    elsif @tree_count <= 50
      new_trees_planted = 0
      new_tree_total = rand(10..15)
      while new_trees_planted <= new_tree_total
        @grove.push(OrangeTree.new)
      end
      @tree_count = @grove.length
    else
      "Your grove is full."
    end
  end

  def grove_one_year
    @grove.each do |tree|
      tree.one_year_passes
    end
    trees_planted
  end

  def count_all_oranges
    @grove.each do |tree|
      @total_oranges += tree.orange_count
    end
    @total_oranges
  end
end

