class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object"
	end
end

instructor = Instructor.new("Chris")
instructor.greeting

student = Student.new("Cristina")
student.greeting

instructor.teach
student.learn

#student.teach
#This does not work because teach is a method within the
#Instructor class and is not accessable by another class