@students = []

def input_students

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
        student_profile = STDIN.gets.strip
        if !student_profile.empty?
            puts "Please enter the information:"

            puts "Please enter your name:"
            name = STDIN.gets.strip
            if name.empty?
                name = "None"
            end

            puts "Please enter your cohort:"
            cohort = months[STDIN.gets.strip.capitalize]
            while cohort == nil
                puts "Try again, please enter your cohort:"
                cohort = months[STDIN.gets.strip.capitalize]
            end

            @students << {name: name, cohort: cohort}

            puts "Now we have #{@students.count} students"
        else
            break
        end
    end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_student_list
    if @students.empty?
        puts "There are no students!".center(50)
    else
        counter = 0
        until counter == @students.length do
            puts %{
                    Name: #{@students[counter][:name]}
                    Cohort: #{@students[counter][:cohort]} cohort}.center(50)
            counter += 1
        end
    end
end


def print_by_cohort

    puts "What cohort would you like to print out?".center(50)
    cohort_print = STDIN.gets.strip.downcase
    if cohort_print.empty?
        puts "There are no students in this cohort!".center(50)
    else
        @students.each do | hash |
        puts hash[:name] if hash[:cohort] == cohort_print.to_sym
        end
    end
end

def print_footer
    if @students.count <= 1
        puts "Overall, we have #{@students.count} great student".center(50)
    else
        puts "Overall, we have #{@students.count} great students".center(50)
    end
end


def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts '3. Save the list to students.csv'
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
    print_by_cohort
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit
    else
        puts "I'm sorry, I dont't know what you mean, try again:".center(50)
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student [:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

# def add_students
#
# end

try_load_students
interactive_menu
