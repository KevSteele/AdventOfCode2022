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

CSV.foreach('puzzle_input.csv').with_index do |row, i|
  if row.first.nil?
    elves << Elf.new(count)
    count = 0
  else
    count += row[0].to_i
    # count += row.first.to_i
  end
end

most_cals = [0, 0, 0]

elves.each do |elf|
  # puts elf.pack_calories
  # if elf.pack_calories >= most_cals[0] || elf.pack_calories >= most_cals[1] || elf.pack_calories >= most_cals[2]
  case
  when elf.pack_calories >= most_cals[0]
    most_cals[0] = elf.pack_calories
  when elf.pack_calories >= most_cals[1]
    most_cals[1] = elf.pack_calories
  else elf.pack_calories >= most_cals[2]
    most_cals[2] = elf.pack_calories
  end
  # else
  #   puts elf.pack_calories
  # end
end

puts count
puts "here are  #{most_cals}"






# number of elves depends on the puzzle_input
# variable for calories
# calories per item
# blank line separates each elf's stuff

# which elf has the most

# elf object with properties :item with properties :calories