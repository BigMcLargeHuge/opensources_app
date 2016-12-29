class ReviewsController < ApplicationController
  authorize_resource class: :controller

  def review
    @submissions = Submission.all
  end


  def update_multiple
    logger.debug "update_multiple"
    logger.debug "update_multiple #{submission_params}"
    @submissions = Submission.update(submission_params[:submissions].keys, params[:submissions].values)

    submission_params[:submissions].each do |key, val|
      puts "test #{key}, #{val[:fresh]}"
      if val[:reviewed] == "1" && val[:fresh] === "true"
        puts "FRESH #{Submission.find(key)}"
        current_user.submissions << Submission.find(key)
        unless Website.where(domain: val[:domain]).exists?
          puts "it exists"
          Website.create(domain: val[:domain])
        end
        puts "about to domain"
        puts "domain is #{val[:domain]}"
        web = Website.find_by(domain: val[:domain])
        puts "web is #{web}"

        thetag = Tag.create(tag_text: val[:tag_text], submission_id: key, website_id: web.id)
        puts "tag is: #{thetag.tag_text}, #{val[:tag_text]}, #{thetag.id}"
      end
      puts "val reviewed is #{val[:reviewed]}"
      if val[:reviewed] == "0"
        begin
          web = Website.find_by(domain: val[:domain])
          thetags = web.tags.where(tag_text: val[:tag_text])
          puts "thetags are #{thetags}"
          thetags.destroy_all
        rescue
          puts "not recognized"
        end
      end
    end


    respond_to do |format|
      flash.now[:notice] = "Updated Submissions"
      format.html {redirect_to review_submissions_path, flash[:notice] = "Updated Submissions"}
      format.js
    end
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
