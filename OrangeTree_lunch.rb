# Group project -- Carly, Brandi, Lila

require "colorize"

# Define class
class OrangeTree
	attr_reader :height, :age, :orange_count, :death_age

	# initialize tree w/ default settings
	def initialize
		@height = 1
		@age = 0
		@orange_count = 0
		@death_age = (rand(90..110)) #random age for tree death 90 - 110
		@max_height = 30
	end

	def count_the_oranges
		@orange_count
	end


	# increases height based on early rapid growth that slows down with time
	def increases_height
		if @age <= 5
			@height += 3	
		elsif @age <=15
			@height += 1
		elsif (@age <= 40) && (@height < @max_height)
			@height += 0.5
		end
	end
	

	# produces oranges, ramps up growth amount and then tapers off with age
	def produces_oranges
		if @age < 6
			@orange_count = 2
		elsif @age >= 6 && @age < 20
			@orange_count = (rand(50..100))
		elsif @age >= 20 && @age < 40
			@orange_count = (rand(100..200))
		elsif @age >= 40 && @age < 60
			@orange_count = (rand(200..300))
		else 
			@orange_count = (rand(100..200))
		end
	end	

	def one_year_passes
		#increases age
		@age += 1
		increases_height
		produces_oranges

		#check for tree death
		if @age >= @death_age
			puts "Your tree has passed on. Goodbye tree."	
			exit  
		end
	end

	def pick_an_orange
		@orange_count -= 1
		if @orange_count <= 0
			puts "Sorry, tree is empty! So sad."
		else
			puts "Delicious orange! So juicy.".colorize(:yellow)
		end
	end
end

#####################################################

# OrangeGrove

class OrangeGrove
	attr_reader :tree_count

	def initialize 
		@grove = []
		@grove.push(OrangeTree.new)
		@tree_count = @grove.length
		@total_oranges = 0
	end
	
	# adds one new tree each year until the age of grove is 10
	def trees_planted
		until @tree_count <= 10 
			@grove.push(OrangeTree.new)  
			@tree_count = @grove.length
		end
		if @tree_count <= 50
			@grove.push(OrangeTree.new) 
			@tree_count = @grove.length
		else
		"Your grove is full"
		end
	end
	
	#increases age of grove one year
	def grove_one_year
		@grove.each do |tree|
			tree.one_year_passes
		end
		trees_planted
	end

	#counts all the oranges from all the trees in the grove
	def count_all_the_oranges
		@grove.each do |tree|
			@total_oranges += tree.count_the_oranges
		end
		@total_oranges
	end
end





















