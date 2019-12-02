#let's put all of the students into an array
students = [
 "Dr. Hannibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates",
]
#and then we print them
puts "The students of Villains Academy"
puts "-------------"
students.each { |names| puts names}
#finally we print the total
puts "Overall, we have #{students.count} great students"
