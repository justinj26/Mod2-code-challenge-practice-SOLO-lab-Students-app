class InstructorsController < ApplicationController

  before_action :find_instructor, only: [:show]

  def index
    @instructors = Instructor.all
  end

  def show
    # byebug
  end

  private

  def find_instructor
    @instructor = Instructor.find(params[:id])
  end



end
