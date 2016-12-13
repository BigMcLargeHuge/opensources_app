class SubmissionsController < ApplicationController
  # invisible_captcha only: [:create, :update], honeypot: :subtitle

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
    @tag = @submission.build_tag
  end

  def create
    if Submission.joins(:tag)
          .where(
            submissions: { domain: submission_params[:domain] },
            tags:        { tag_text: submission_params[:tag_attributes][:tag_text] }
          ).exists?
      redirect_to root_path, notice: "Thank you for your submission."
    else
      @submission = Submission.new(submission_params)

      if @submission.save
        redirect_to root_path, notice: "Thank you for your submission."
      else
        logger.debug @submission.errors.inspect
        render 'new'
      end
    end
  end

  private

  def submission_params
    # changing tag to tag_attributes
    # params[:submission][:tag_attributes] = params[:submission][:tag] if params[:submission][:tag]
    params.require(:submission).permit(:subtitle, :domain, :type1, :type2, :type3, :website_type, :user_id, :notes, tag_attributes:[:tag_text, :notes])
  end

  # def your_spam_callback_method
  #   redirect_to root_path
  # end
end
