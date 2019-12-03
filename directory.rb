def input_students

    students = []

    while true do
        puts "Type 'yes' to create a Student Profile? (To finish just hit 'return')"
        student_profile = gets.chomp
        if !student_profile.empty?
            puts "Please enter the information:"

            puts "Please enter your name:"
            name = gets.chomp

            puts "What are your hobbies:"
            hobbies = gets.chomp

            puts "where were you born:"
            country = gets.chomp

            puts "How tall are you?"
            height = gets.chomp

            students << {name: name, hobbies: hobbies, country: country, height: height, cohort: :november}

            puts "Now we have #{students.count} students"
        else
            break
        end
    end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
    counter = 0
    until counter == students.length do
        puts %{
                Name: #{students[counter][:name]}
                Hobby: #{students[counter][:hobbies]}
                Country: #{students[counter][:country]}
                Height: #{students[counter][:height]}
                Cohort: #{students[counter][:cohort]} cohort}.center(50)
        counter += 1
    end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
end

students = input_students

print_header
print(students)
print_footer(students)
