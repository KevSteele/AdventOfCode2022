require 'csv'
CSV.read('puzzle_input.csv')

class Elf
  attr_accessor :pack_calories

  def initialize(total_cal)
    @pack_calories = total_cal
  end
end

count = 0
elves = []

CSV.foreach('puzzle_input.csv') do |row|
  if row.first.nil?
    elves << Elf.new(count)
    count = 0
  else
    count += row[0].to_i
    # count += row.first.to_i
  end
end

most_cals = [0, 0, 0]
elves_sort = []

elves.each do |elf|
  elves_sort << elf.pack_calories
end

elves_sort.sort!
num_elves = elves_sort.length

most_cals[0] = elves_sort[num_elves - 1].to_i
most_cals[1] = elves_sort[num_elves - 2].to_i
most_cals[2] = elves_sort[num_elves - 3].to_i

puts "The 3 elves with the most calories are each carrying:  #{most_cals}"
puts "The elf carrying the most calories has #{most_cals[0]} calories."
puts "The sum of calories carried by the 3 elves with the most is #{most_cals.sum}"
