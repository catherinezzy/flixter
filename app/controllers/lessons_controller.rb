class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_course_enrollment_for_lesson, only: :show
  def show
  end

  private

  def require_course_enrollment_for_lesson
    current_course = current_lesson.section.course

    if current_user && current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: 'Please enroll in this course to view its lessons'
    end
  end



  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end