class IssuesController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def new
    @user = current_user
    @issue = @user.issues.build
  end

  def create
    @user = current_user
    @issue = @user.issues.build(issue_params)

    if @issue.save
      redirect_to root_path, notice: "Thank you for reporting this.  We will review it and get back to you as soon as we can."
    else
      render 'new', alert: "Unable to save report."
    end
  end

  def edit
  end

  def show
  end
end

private

  def issue_params
    params.require(:issue).permit(:issue_text, :domain, :user_id, :website_id)
  end
