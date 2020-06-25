class Student < ApplicationRecord
    belongs_to :instructor

    validates :age, numericality: { only_integer: true, greater_than: 18 }

    def instructor_name
        self.instructor.name 
    end
end
