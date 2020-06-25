class Instructor < ApplicationRecord
    has_many :students

    def average_age
        student_ages = self.students.map do |student|
            student[:age]
        end
        the_average = student_ages.sum / student_ages.count
        the_average 
    end

    def students_alphabetical
        alphabetical = self.students.sort do |student_1, student_2|
            student_1[:name] <=> student_2[:name] 
        end
        alphabetical
    end

end
