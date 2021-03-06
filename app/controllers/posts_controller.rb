class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user, except: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # user = User.find(params[:user_id])
    # post = user.post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    unless @post.user == current_user
      redirect_to home_path, notice: "This post doesn't belong to you!"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user # jeremiah's line. added to define current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to [current_user, @post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [current_user, @post] } #syntax changed based on jeremiah's explanation of how to direct to nested routes
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [current_user, @post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: [current_user, @post] }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user == current_user
      @post.destroy
      respond_to do |format|
        format.html { redirect_to user_posts_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else redirect_to home_path, notice: "This post doesn't belong to you!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

    def edit_post
      if @post.user != current_user
        flash[:error] = "You're not allowed to edit other users' posts"
        redirect_to posts_url
      end
    end

    def del_post
      if @post.user != current_user.email
        flash[:error] = "You're not allowed to delete other users' posts"
        redirect_to posts_url
      end
    end
end
