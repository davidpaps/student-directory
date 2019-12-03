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
    puts "Please enter the following information:"
    puts "To finish just hit return twice!"

    students = []

    puts "Please enter your name:"
    name = gets.chomp
    if name.empty?
        name = "None"
    end

    puts "Please enter your cohort:"
    cohort = months[gets.chomp.capitalize]
    while cohort == nil
        puts "Try again, please enter your cohort:"
        cohort = months[gets.chomp.capitalize]
    end


    while !name.empty? do

      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"

      name = gets.chomp
    end

    students
end

  def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
  end

  def print(students)
    students.each do |student|
        puts %{
            Name: #{student[:name]}
            Cohort: #{student[:cohort]}}
        end
  end

  def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(50)
  end

  students = input_students

  print_header
  print(students)
  print_footer(students)
  
