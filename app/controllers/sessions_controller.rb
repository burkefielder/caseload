# get rid of rubocop error
class SessionsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @session = @student.sessions
  end

  def new
    @student = Student.find(params[:student_id])
    @session = @student.sessions.new
  end

  def create
    @student = Student.find(params[:student_id])
    @session = @student.sessions.new(session_params)
    if @session.save
      flash[:notice] = 'Therapy note successfully added'
      redirect_to student_sessions_path(@student)
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:date, :minutes, :notes)
  end
end
