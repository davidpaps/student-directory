
def input_students
  puts "Please ente the name of the students"
  puts "To finish just hit return twice"
# Create an empty array:
  students = []
# Get the first name:
  name = gets.chomp
# While the name is not empty, repeat this code:
  while !name.empty? do
# Add the student hash to the array:
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
# Get another name from the user:
    name = gets.chomp
  end
# Return the array of the students:
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].index("d") == 0
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
# Nothing happens here until we call the methods:
print_header
print(students)
print_footer(students)
