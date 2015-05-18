# Orange Grove
class OrangeGrove

  attr_reader :grove, :num_of_trees, :total_oranges
  def initialize(num_of_trees)
    @grove = []
    @num_of_trees = num_of_trees
    populate_grove
    @total_oranges = 0

  end

#populating grove with the number of trees
#specified in the initialize method given from user
  def populate_grove
    @num_of_trees.times do |tree|
    tree = OrangeTree.new
      @grove.push(tree)
    end
  end

# for each tree planted,
# call the one_year_passes method from the orange tree class
def one_year_passes
  @grove.each do |tree|
    tree.one_year_passes
  end
end

#count the_oranges method
  def count_all_oranges
    @total_oranges = 0
    @grove.each do |tree|
      @total_oranges += tree.orange_count
    end
    puts @total_oranges
  end


end


class OrangeTree

	attr_accessor :tree_age, :orange_count

  # this reader is redundant to the height method below
  # but breakfast called for a specific height method
  attr_reader :height

# initializing baby tree at 0
	def initialize
		@height = 0
		@tree_age = 0
		@orange_count = 0
	end

	def count_the_oranges
		puts @orange_count
	end

# pick_an_orange

	def pick_an_orange
		puts @orange_count

    # reduces orange by 1 and puts statement "tasty"
		if @orange_count >= 1
			@orange_count -= 1
			puts "Tasty"
			puts @orange_count
		else
      #if orange_count = 0 then puts if statement
			puts "No oranges to eat :("
			puts @orange_count
		end
	end

  # returning the height value when we call this method
  	def height
  		puts @height
  	end
# one_year_passes (increases age of tree by 1 and height by 5ft; once it's 10 yrs old, it dies (i.e. puts "I'm died"))

# var @this_year_crop is to hold the original orange count value to later be incremented so that picking oranges doesn't affect it

	def one_year_passes
		@tree_age += 1
		@height += 5

		if @tree_age < 3
			@this_year_crop = 0
			puts @this_year_crop
			puts "Your tree is #{@tree_age} years(s) old, is #{@height} ft. tall and has #{@this_year_crop} oranges."


		elsif @tree_age == 3
			@this_year_crop += 8
      puts "Your tree is #{@tree_age} years(s) old, is #{@height} ft. tall and has #{@this_year_crop} oranges."


		elsif (@tree_age > 3) && (@tree_age <=10)
			@this_year_crop += 3
			puts @this_year_crop
      puts "Your tree is #{@tree_age} years(s) old, is #{@height} ft. tall and has #{@this_year_crop} oranges."
    end

		if @tree_age > 10
			@height = 50
			@tree_age = 10
			@this_year_crop = 0
			puts "I'm dead."
		end

		@orange_count = @this_year_crop

	end

end
