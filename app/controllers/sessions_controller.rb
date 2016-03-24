# get rid of rubocop error
class SessionsController < ApplicationController
  before_action :set_student

  def index
    @session = @student.sessions
  end

  def new
    @session = @student.sessions.new
  end

  def create
    @session = @student.sessions.new(session_params)
    if @session.save
      flash[:notice] = 'Therapy note successfully added'
      redirect_to student_sessions_path(@student)
    else
      render :new
    end
  end

  def show
    @session = @student.sessions.find(params[:id])
  end

  def edit
    @session = @student.sessions.find(params[:id])
  end

  def update
    @session = @student.sessions.find(params[:id])
    if @session.update(session_params)
      flash
      redirect_to student_sessions_path(@student), notice: 'Note successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @session = @student.sessions.find(params[:id])
    @session.destroy
    redirect_to student_sessions_url
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def session_params
    params.require(:session).permit(
      :date,
      :minutes,
      :therapy,
      :notes
    )
  end
end
