class PostsController < ApplicationController
  before_action :set_subreddit
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = @subreddit.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = @subreddit.posts.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = @subreddit.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.subreddit = @subreddit
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to subreddit_post_path(@subreddit, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to subreddit_posts_path(@subreddit), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_subreddit
    @subreddit = Subreddit.find(params[:subreddit_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = @subreddit.posts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :description)
  end
end
