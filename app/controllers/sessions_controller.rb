# get rid of rubocop error
class SessionsController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @session = @student.sessions
  end
end
