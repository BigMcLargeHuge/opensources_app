class ReviewsController < ApplicationController
  authorize_resource class: :controller

  def review
    @submissions = Submission.all
  end


  def update_multiple
    logger.debug "update_multiple"
    logger.debug "update_multiple #{submission_params}"
    @submissions = Submission.update(submission_params[:submissions].keys, params[:submissions].values)

    respond_to do |format|
      format.js {flash[:notice] = "Updated Submissions"}
    end

    redirect_to review_submissions_path
  end

  def update
    @submission = Submission.find(submission_params[:id])
    if @submission.update_attributes(submission_params[:id])
      redirect_to root_path, notice: "successfully updated!"
    end
  end

  private

  def submission_params
    params.permit!
  end

end
