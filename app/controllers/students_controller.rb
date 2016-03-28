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
    if @student.update(student_params)
      flash
      redirect_to @student, notice: 'Student successfully updated!'
    else
      render :edit
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash
      redirect_to @student, notice: 'Student successfully added.'
    else
      flash
      render :new
    end
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
