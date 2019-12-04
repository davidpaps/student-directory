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
    if students.empty?
        puts "There are no students!".center(50)
    else
        counter = 0
        until counter == students.length do
            puts %{
                    Name: #{students[counter][:name]}
                    Cohort: #{students[counter][:cohort]} cohort}.center(50)
            counter += 1
        end
    end
end


def print_by_cohort(students)

    puts "What cohort would you like to print out?".center(50)
    cohort_print = gets.strip.downcase
    if cohort_print.empty?
        puts "There are no students in this cohort!".center(50)
    else
        students.each do | hash |
        puts hash[:name] if hash[:cohort] == cohort_print.to_sym
        end
    end
end

def print_footer(names)
    if names.count <= 1
        puts "Overall, we have #{names.count} great student".center(50)
    else
        puts "Overall, we have #{names.count} great students".center(50)
    end
end

def interactive_menu
    students =[]
    loop do
        # 1. print the menu and ask the user what to do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        # 2. read the input and save it into a variable
        selection = gets.chomp
        # 3. do what the user has asked
        case selection
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
            print_by_cohort(students)
        when "9"
            exit # Terminated the whole program!
        else
            puts "I'm sorry, I dont't know what you mean, try again:".center(50)
        end
    end
end

interactive_menu
