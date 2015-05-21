# # Orange Tree



# class OrangeGrove <= ignore. didn't get the chance to explore further.

# 	def initialize
# 		@grove = []
# 	end

# 	def populate.grove
# 		10.times do |tree|
# 			tree + OrangeTree.new
# 			@grove.push (tree)
# 		end
# 	end
# 	puts @grove


# 	def count_all_the_oranges
# 		@grove.each do |tree|
# 			tree = tree.count_the_oranges 
# 	end

# end



class OrangeTree

	# attr_accessor :height, :tree_age, :orange_count 
	#do we need this????????????????????????????

# initializing baby tree at 0
	def initialize
		@height = 0
		@tree_age = 0
		@orange_count = 0
	end

# returning the height value when we call this method
	def height
		puts @height
	end

# returns the number of oranges and the tree age as an FYI

	def count_the_oranges
		puts @tree_age.to_s + " years old"
		puts @orange_count.to_s + " oranges."
	end

# pick_an_orange (reduces orange by 1 and puts statement "tasty"; if orange_count = 0 then puts dif statement "whomp")

	def pick_an_orange
		puts @orange_count

		if @orange_count >= 1
			@orange_count -= 1
			puts "Tasty"
			puts @orange_count
		else 
			puts "No oranges to eat :("
			puts @orange_count
		end
	end

# one_year_passes (increases age of tree by 1 and height by 5ft; once it's 10 yrs old, it dies (i.e. puts "I'm died"))

# NOTE: var @this_year_crop is to hold the original orange count value to later be incremented so that picking oranges doesn't affect it

	def one_year_passes
		@tree_age += 1
		@height += 5

		if @tree_age < 3
			@this_year_crop = 0
			puts @this_year_crop
			puts "Your tree is " + @tree_age.to_s + " years(s) old, is " + @height.to_s + " ft. tall and has " + @this_year_crop.to_s + " oranges."


		elsif @tree_age == 3
			@this_year_crop += 8
			puts "Your tree is " + @tree_age.to_s + " years(s) old, is " + @height.to_s + " ft. tall and has " + @this_year_crop.to_s + " oranges."


		elsif (@tree_age > 3) && (@tree_age <=10)
			@this_year_crop += 3
			puts @this_year_crop
			puts "Your tree is " + @tree_age.to_s + " years(s) old, is " + @height.to_s + " ft. tall and has " + @this_year_crop.to_s + " oranges."


		elsif @tree_age > 10
			@height = 50
			@tree_age = 10
			@this_year_crop = 0
			puts "I'm dead."
		end

		@orange_count = @this_year_crop
 		
	end

end





