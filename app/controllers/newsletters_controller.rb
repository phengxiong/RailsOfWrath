class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy, :mail]

  respond_to :html

  def mail    # mail_newsletter_path
    users = User.where(:newsletter => true)
    users.each do |user|
      UserMailer.newsletter(@newsletter, current_user).deliver
      end
    redirect_to newsletters_path, notice: 'Newsletter was successfully sent.!'
    end
  


  def index
    @newsletters = Newsletter.all
    respond_with(@newsletters)
  end

  def show

  end

  def new
    @newsletter = Newsletter.new
    respond_with(@newsletter)
  end

  def edit

  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.save
    respond_with(@newsletter)
  end

  def update
    @newsletter.update(newsletter_params)
    respond_with(@newsletter)
  end

  def destroy
    @newsletter.destroy
    respond_with(@newsletter)
  end

  private
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    def newsletter_params
      params.require(:newsletter).permit(:title, :author, :content)
    end
end
