class SubredditsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  def search
    @subreddits = Subreddit.search(params[:search])
    render 'index'
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = current_user.subreddits.build(subreddit_params)
    if @subreddit.save
      flash[:success] = "Micropost created!"
      redirect_to @subreddit
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def subreddit_params
    params.require(:subreddit).permit(:name, :description)
  end

end
