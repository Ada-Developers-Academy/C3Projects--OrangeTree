# Orange Tree
# group: Alice, Elia, Jeri

class OrangeTree
	attr_reader :age, :alive, :grove, :height, :orange_count

	def initialize
		@age = 0
		@alive = true
		@height = 0
		@orange_count = 0
	end

	# start growing oranges at age 3 years
	def grow_oranges
		if @age >= 3
			# number of oranges grown depends on soil_quality
			if @grove.soil_quality == "unhealthy"
				@orange_count = @age
			elsif @grove.soil_quality == "average"
				@orange_count = @age * 2
			else
				@orange_count = @age * 3
			end
		end
	end

	# trees grow 2 feet per year up til age 5, at which point they grow 0.1 feet / year
	def grow_taller
		if @age < 5
			@height += 2
		else
			@height += 0.1
		end
	end

	def kill_tree
		@alive = false
		@orange_count = 0
		@age = 0 # problems?
		@height = 0
		puts "This tree has died."
	end

	# the soil quality of the grove affects when a tree dies
	def grow_older
		if @grove
			if @grove.soil_quality == "unhealthy" && @age >= 5
				kill_tree
			elsif @grove.soil_quality == "average" && @age >= 8
				kill_tree
			end
		end

		# if a tree isn't dead, increment the age by 1
		if age >= 10
			kill_tree
		else
			@age += 1
		end

	end

	# when a year passes, the tree grows older, gets taller, and grows oranges
	def one_year_passes
		grow_older
		if @alive == true
			grow_taller
			grow_oranges
		end

		# if the tree is in a grove, that grove's soil quality is updated
		if @grove
			@grove.soil_quality
		end
	end

	# pick orange or tell user there are no oranges
	def pick_orange
		if @orange_count != 0
			@orange_count -= 1
			puts "That was a very tasty orange."

		else
			puts "There are no more oranges to pick this year."
		end
	end

	# add tree to grove
	def plant_on(grove_name)
		grove_name.trees.push(self)
		@grove = grove_name
	end
end


class OrangeGrove
	attr_reader :total_orange_count, :trees

	def initialize
		@trees = []
		@total_orange_count = 0
		@soil_quality = "healthy"	# start soil_quality at healthy level
	end

	def soil_quality
		# returns soil_quality based on how many trees are in the grove
		if @trees.length <= 5
			@soil_quality = "healthy"
		elsif @trees.length <=10
			@soil_quality = "average"
		else
			@soil_quality = "unhealthy"
		end
		return @soil_quality
	end

	# add trees to a grove
	def plant_trees(number)
		# check the input to make sure it's an integer
		if number.to_i != 0 && !(number.to_s.include?("."))
			number.times do
				new_tree = OrangeTree.new
				new_tree.plant_on(self)
			end
			soil_quality
		else
			puts "You can't plant #{number} trees. Please try again with a number."
		end
	end

	# one year passes for the entire grove
	def one_year_passes_grove
		@total_orange_count = 0
		@trees.each do |tree|
			tree.one_year_passes
			@total_orange_count += tree.orange_count
		end
		# soil_quality
	end

end
