class SubmissionsController < ApplicationController
  invisible_captcha only: [:create, :update], honeypot: :subtitle

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to root_path, notice: "Successfuly created new submission."
    else
      render 'new'
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:domain, :type1, :type2, :type3, :website_type, :user_id, :notes)
  end

  def your_spam_callback_method
    redirect_to root_path
  end
end
