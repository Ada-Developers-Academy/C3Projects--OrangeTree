# ORANGE TREE ------------------------------------------------------------------------------->

module Orange
	class OrangeTree

		attr_reader :age, :orange_count

		def initialize
			@height = 0
			@age = 0
			@max_age = 100
			@dead = false
		end

		# Ages tree one year, grows tree 0.75ft/year, increases oranges/tree after age 3
		# Determines if it's the tree's time to shuffle off the mortal coil
		def one_year_passes
			@orange_count = 0
			@age += 1
			@height += 0.75
			if @age < 3
				@orange_count = 0
			elsif @age >= @max_age
				@dead == true
				puts "Yo tree is ded."
			else
				@orange_count = @age * 2
			end
		end

		# Counts oranges on tree
		def count_the_oranges
			puts "Your tree has #{@orange_count} tasty oranges!"
			return @orange_count
		end

		# Tells us tree's height
		def tree_height
			puts "Your tree is #{@height}ft. tall."
			return @height
		end

		# Removes one orange from tree and updates count. 
		# If no oranges are present, says there aren't any.
		def pick_an_orange
			if @orange_count > 0
				@orange_count -= 1
				puts "This orange is DOPE! Don't do drugs."
			else 
				puts "Darn, no oranges. :("
			end
			return @orange_count
		end		
	end


	# ORANGE GROVE ------------------------------------------------------------------------------>

	class OrangeGrove
		NUMBERS = %w(0 1 2 3 4 5 6 7 8 9)

		attr_reader :tree_count, :orange_total, :tree

		# Creates a grove with num of trees based on user input, accounts for num < 2 and non-numeric inputs
		def initialize
			create_trees

			@tree_count = @tree_count.to_i
			@orange_total = 0
			@tree = OrangeTree.new
		end

		# Creates trees for grove
		def create_trees
			print "How many trees would you like in your grove? "
			@tree_count = gets.chomp
			while @tree_count.to_i < 2 || @tree_count.empty? == true || !NUMBERS.include?(@tree_count)
				puts "#{@tree_count} does not make a grove, stupid. Just kidding. But seriously, you need at least two trees for a grove.\nTry again."
				@tree_count = gets.chomp
			end
			return @tree_count
		end

		# Ages all trees in the grove one year, puts age of tree and oranges on each tree.
		# Returns tree age
		def one_grove_year
			(@tree.one_year_passes) * @tree_count
			puts "Your trees are #{@tree.age} year(s) old. They each have #{@tree.orange_count} oranges."
			return @tree.age
		end

		# Counts total oranges in grove
		def count_all_oranges
			@orange_total = @tree.orange_count * @tree_count
			puts "Your grove has #{@orange_total} oranges! YAY!"
			return @orange_total
		end

	end
end
