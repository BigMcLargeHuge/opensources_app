class SubmissionsController < ApplicationController
  load_and_authorize_resource
  skip_before_filter :verify_authenticity_token, :only => :update_multiple
  # invisible_captcha only: [:create, :update], honeypot: :subtitle

  def index
    @submissions = Submission.all
  end


  def new
    # @user = current_user
    # @submission = @user.submissions.build
    @tag = @submission.build_tag
  end

  def create
    @user = current_user
    if @user.submissions.joins(:tag)
          .where(
            submissions: { domain: submission_params[:domain] },
            tags:        { tag_text: submission_params[:tag_attributes][:tag_text] }
          ).exists?
      redirect_to root_path, notice: "Thank you for your submission."
    else
      @submission = @user.submissions.build(submission_params)

      if @submission.save
        redirect_to root_path, notice: "Thank you for your submission."
      else
        logger.debug @submission.errors.inspect
        render 'new'
      end
    end
  end

  def show
  end

  def update
    @submission = Submission.find(submission_params[:id])
    if @submission.update_attributes(submission_params[:id])
      redirect_to root_path, notice: "successfully updated!"
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:subtitle, :domain, :type1, :type2, :type3, :website_type, :user_id, :notes, tag_attributes:[:tag_text, :notes])
  end

end
