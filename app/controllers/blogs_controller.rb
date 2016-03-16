# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  
  #before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /blogs
  # GET /blogs.json
  def index
    #raise
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @comment = @blog.comments.build
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    
  end

  # POST /blogs
  # POST /blogs.json
  def create
    #@user = Blog.find(current_user)
    #@blog = user.blogs.build(blog_params)
    #@blog = Blog.new(blog_params)
    #@blog = current_user.blogs.build(blog_params)
   # @blog = Blog.new(params[:blog].permit!)
   @blog = current_user.blogs.build(params[:blog].permit!)
    

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'ブログの作成に成功しました。' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      #if @blog.update(blog_params)
      if @blog.update(params[:blog].permit!)
        format.html { redirect_to @blog, notice: 'ブログの更新に成功しました。' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    #if @blog.id == 19
      @blog.destroy
      respond_to do |format|
        format.html { redirect_to blogs_url, notice: 'ブログを削除しました。' }
        format.json { head :no_content }
      #end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
      #binding.pry
    end
    def set_user
      @user = current_user
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    # def blog_params
    #   params.require(:blog).permit(:title,:content,:user_id)
    # end
    #def logged_in_user
      #unless logged_in?
        #store_location
        #flash[:danger] = "ログインしてください。."
       # redirect_to login_url
      #end
    #end
    def correct_user
     # @user = User.find(34)
      @user = User.find(Blog.find(params[:id])[:user_id])
      #binding.pry
      redirect_to(root_url) unless @user == current_user
      #redirect_to(root_url) unless current_user?(@user)
    end
end
