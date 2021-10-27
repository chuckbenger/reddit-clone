class SubredditsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit update destroy create]

  def index
    @subreddits = Subreddit.paginate(page: params[:page])
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  def search
    @subreddits = Subreddit.paginate(page: params[:page]).search(params[:search])
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

  private

  def subreddit_params
    params.require(:subreddit).permit(:name, :description)
  end

end
