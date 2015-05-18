class OrangeTree

  attr_accessor :height, :tree_age, :orange_count

  def initialize
    @height = 0
    @tree_age = 0
    @orange_count = 0
    @orange_count_ly = 0
  end


  def height
    puts @height
  end

# count_the_oranges returns the number of oranges ased on age and if any has been picks
def count_the_oranges
  puts @tree_age.to_s + " years old"

  if @tree_age < 3
    @orange_count = 0
    puts @orange_count

  elsif @tree_age == 3
    @orange_count = 8
    puts @orange_count

  elsif (@tree_age > 3) && (@tree_age <= 10)
    @orange_count = @orange_count_ly + 3
    puts @orange_count
  elsif @tree_age > 10
    puts "I'm dead"

  end
  @orange_count_ly = @orange_count
  puts @orange_count_ly
  puts @orange_count
end

#pick_an_orange reduces orange by one and puts statement tasty.
# if orange_count is zero puts different statement
  def pick_an_orange

    if (@orange_count_ly >= 1)
      @orange_count_ly -= 1 # pick 1 orange
      puts "Tasty"
    else
      puts "No oranges to eat :("
    end
  end

# one_year_passes increases age of tree by one, resets orange count to x,
#once it's 10 years old it dies and puts it's dead.
  def one_year_passes
    @tree_age += 1
    @height += 5
    @orange_count = 0

    count_the_oranges #calling out the count_the_oranges method
                      # so it knows orange count relative to tree age
    if @tree_age > 10
      puts "I'm still dead."
    else puts "Your tree is #{@tree_age} year(s) old, and is #{@height} ft. tall and has" + @orange_count.to_s + " oranges."
    end
  end

end
