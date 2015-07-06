require "temperature"

class OrangeTree
  attr_reader :age, :is_dead, :max_age, :height, :count

  def initialize
    @age = 0
    @height = 0
    @count = 0
    @max_age = 10
    @is_dead = false
  end

  def one_year_passes
    @age += 1
    @height += 4
    @count = 0
    puts "The age of your tree is #{@age}"
    if age > max_age
      @is_dead = true
      puts "Your tree is dead."
    end
  end

  def temp
    puts "to enter a temperature in celsius and convert it to fahreneit, enter to f. \n To enter a temperature in fahreneit and convert it to celsius enter to c."
    f_or_c = gets.chomp.downcase
    puts "enter a temperature"
    temp = gets.chomp.to_i
    f_temp = nil
    c_temp = nil
    while f_temp.nil? || c_temp.nil?
      if f_or_c == "to f"
        f_temp = Temperature.new(temp, :fahreneit)
        puts f_temp.to_celsius
      elsif f_or_c == "to f"
        c_temp = Temperature.new(temp, :celsius)
        puts c_temp.to_fahrenheit
      else
        puts "please enter a valid option"
        break
      end
    end
  end

  def grow_oranges
    if @count == 0
      if @age <= 6 && @age >= 3
        @count = rand(50..100)
        return @count
        puts "your orange count #{@count}"
      elsif @age < @max_age && @age > 6
        @count = rand(100..300)
        puts "your orange count #{@count}"
        return @count
      else
        @count = 0
        puts "The tree doesn't produce fruit at this time. Try again in a year."
        return @count
      end
    end
    
  end

  def pick_orange
    if @count > 0
      @count -= 1
      puts "Nom, nom, nom. This orange is soooooo good!"
    else
      puts "There are no more oranges to be picked."
    end
  end


end

class Grove
  attr_reader :trees, :count, :age

  def initialize(trees)
    tree_array = []
    (1..trees).each do |initialize|
      tree_instance = OrangeTree.new
      tree_array.push(tree_instance)
    end
    puts tree_array
    @trees = tree_array
    @age = 0
    @count = 0
  end

  def count_all_oranges
    orange_count = 0
    @trees.each do |t|
      orange_count += t.grow_oranges.to_i
    end
    return orange_count
  end

  def grow_grove
    @trees.each do |t|
      t.one_year_passes
    end    
  end
  
end






