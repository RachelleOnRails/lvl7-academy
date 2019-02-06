class FeedbacksController < ApplicationController

	def index
		@feedbacks = Feedback.all
	end

	def show
    @feedback = Feedback.find(params[:id])
	end

	def edit
    @feedback = Feedback.find(params[:id])
	end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(feedback_params)
      redirect_to @feedback, notice: "Feedback successfully updated!"
    else
      render :edit
    end
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @user = User.find_by(email: @feedback.email_address)

    if @user.nil?
      #send confirmation email - pending
      #add user to database
      User.create!(name: @feedback.email_address, email: @feedback.email_address)
    end

    @feedback.user = User.find_by(email: @feedback.email_address)
    if @feedback.save
      redirect_to @feedback, notice: "Feedback successfully created!"
    else
      render :new
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to feedbacks_url, alert: "Feedback successfully deleted!"
  end

private

  def feedback_params
    params.require(:feedback).
      permit(:title, :description, :importance, :email_address)
  end
end
