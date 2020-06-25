class StudentsController < ApplicationController

  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new 
    get_instructors 
  end

  def create
    # byebug
    @instructor = Instructor.find(params[:student][:instructor_id])
    @student = Student.new(student_params)
      if @student.valid?
        @student.save
        redirect_to instructor_path(@instructor)
      else
        flash[:errors] = @student.errors.full_messages
        redirect_to new_student_path
      end
  end

  def edit 
    get_instructors 
  end

  def update
    @student.attributes = student_params 
    if @student.valid? 
      @student.save
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages 
      redirect_to edit_student_path(@student) 
    end
  end



  private

  def find_student
    @student = Student.find(params[:id])
  end

  def get_instructors
    @instructors = Instructor.all 
  end

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end
  
end
