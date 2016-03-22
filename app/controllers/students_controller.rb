# get rid of rubocop error
class StudentsController < ApplicationController
  def index
    @students = Student.first_name_asc
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to @student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to @student
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url
  end

  private

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :age,
      :grade,
      :triennial,
      :iep_date,
      :min_hours,
      :diagnosis,
      :dismissed
    )
  end
end
