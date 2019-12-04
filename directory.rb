def input_students

    students = []

    months = {
        "" => :na,
        "January" => :january,
        "February" => :february,
        "March" => :march,
        "April" => :april,
        "May" => :may,
        "June" => :june,
        "July" => :july,
        "August" => :august,
        "September" => :september,
        "October" => :october,
        "November" => :november,
        "December" => :december
    }

    while true do
        puts "Type 'yes' to create a Student Profile? (To finish just hit 'return')"
        student_profile = gets.strip
        if !student_profile.empty?
            puts "Please enter the information:"

            puts "Please enter your name:"
            name = gets.strip
            if name.empty?
                name = "None"
            end

            puts "Please enter your cohort:"
            cohort = months[gets.strip.capitalize]
            while cohort == nil
                puts "Try again, please enter your cohort:"
                cohort = months[gets.strip.capitalize]
            end

            students << {name: name, cohort: cohort}

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
                Cohort: #{students[counter][:cohort]} cohort}.center(50)
        counter += 1
    end
end


def print_by_cohort(students)

    puts "What cohort would you like to print out?".center(50)
    cohort_print = gets.strip.downcase

    students.each do | hash |
        puts hash[:name] if hash[:cohort] == cohort_print.to_sym
    end
end

def print_footer(names)
    if names.count <= 1
        puts "Overall, we have #{names.count} great student".center(50)
    else
        puts "Overall, we have #{names.count} great students".center(50)
    end
end

students = input_students

print_header
print(students)
print_footer(students)
print_by_cohort(students)
