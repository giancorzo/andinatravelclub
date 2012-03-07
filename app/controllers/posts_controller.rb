class PostsController < ApplicationController
  
  skip_before_filter :check_account, :only => [:index, :show]
  
  # GET /posts
  # GET /posts.xml
  def index    
    if current_account
      @header_tab = "blog"
      @posts = Post.all
      render :layout => "admin"
    else
      @posts = Post.all
      @popular = Post.where("popular = 1").all
      render :layout => "application"
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show    
    if current_account
      @header_tab = "blog"
      @post = Post.find(params[:id])
      render :layout => "admin"
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @header_tab = "blog"
    @post = Post.new
    render :layout => "admin"
  end

  # GET /posts/1/edit
  def edit
    @header_tab = "blog"
    @post = Post.find(params[:id])
    render :layout => "admin"
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, :notice => 'Post was successfully created.' }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_path, :notice => 'Post was successfully updated.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
