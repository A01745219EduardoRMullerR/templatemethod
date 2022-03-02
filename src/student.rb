#Template Method Pattern
#Date: 28/02/2022
# Authors:
#   A01376228   Sebastian Morales Martin
#   A01745219   Eduardo Roberto Muller Romero

# File name: student.rb (from arielortiz.info)

class Student

    include Enumerable
    # Note: This class does not support the max, min, 
    # or sort methods.
  
    def initialize(id, name, grades)
      @id = id
      @name = name
      @grades = grades
    end
  
    def inspect
      "Student(#{@id}, #{@name.inspect})"
    end
  
    def grade_average
      @grades.inject(:+)/@grades.size
    end
  
    def each &block
      yield @id
      yield @name
      @grades.each(&block)
      yield grade_average
    end
  
  end