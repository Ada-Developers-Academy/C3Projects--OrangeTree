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

	# one year passes on one tree- main method call- calls private methods
	def one_year_passes
		grow_older
		if @alive == true
			grow_taller
			grow_oranges
		end

		if @grove
			@grove.soil_quality
		end
	end

	def pick_orange
		if @orange_count != 0
			@orange_count -= 1
			puts "That was a very tasty orange."

		else
			puts "There are no more oranges to pick this year."
		end
	end

	def plant_on(grove_name)
		grove_name.trees.push(self)
		@grove = grove_name
	end

	# put below methods as private since they should all be called within other methods
	private

	#trees start growing oranges at 3-- grow fewer oranges based on soil quality
	def grow_oranges
		if @age >= 3
			if @grove
			 	if @grove.soil_quality == "healthy"
				@orange_count = @age * 3
				elsif	@grove.soil_quality == "unhealthy"
					@orange_count = @age
				elsif @grove.soil_quality == "average"
					@orange_count = @age * 2
				end
			else
				@orange_count = @age * 3
			end
		end
	end

	# grows two feet each year until 5, then grows only a little bit
	def grow_taller
		if @age < 5
			@height += 2
		else
			@height += 0.1
		end
	end

	# what happens when tree gets too old and dies.
	# may still be issues with removing dead trees from groves
	def kill_tree
		@alive = false
		@orange_count = 0
		@age = 0
		@height = 0
		puts "This tree has died."
	end

	#either makes tree a year older or kills it if it is too old
	def grow_older
		if @grove
			if @grove.soil_quality == "unhealthy" && @age >= 5
				kill_tree
			elsif @grove.soil_quality == "average" && @age >= 8
				kill_tree
			end
		end

		if age >= 10
			kill_tree
		else
			@age += 1
		end

	end
end


class OrangeGrove
	attr_reader :total_orange_count, :trees

	def initialize
		@trees = []
		@total_orange_count = 0
		@soil_quality = "healthy"
	end

	def soil_quality
		# up to 5 trees- healthy 6-10 average, 11+ unhealthy.
		# think dead trees will still affect soil quality
		if @trees.length <=5
			@soil_quality = "healthy"
		elsif @trees.length <=10
			@soil_quality = "average"
		else
			@soil_quality = "unhealthy"
		end
		return @soil_quality
	end

	# plants multiple trees on a grove. gives error message for not putting in a number
	def plant_trees(number)
		if number.to_i != 0
			number.times do
				new_tree = OrangeTree.new
				new_tree.plant_on(self)
			end
			soil_quality
		else
			puts "You can't plant #{number} trees. Please try again with a number."
		end
	end

	# method to make one year pass for the whole grove
	def one_year_passes_grove
		@total_orange_count = 0
		@trees.each do |tree|
			tree.one_year_passes
			@total_orange_count += tree.orange_count
		end
		soil_quality
	end

end
