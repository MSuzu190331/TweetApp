class PostsController < ApplicationController
  def index
    # Post.allにorderメソッドを用いて、新しい投稿が上から順に表示されるようにしてください
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice]= "編集しました"
      redirect_to("/posts/index")
    else
        render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]= "削除しました"
    redirect_to("/posts/index")
  end

end
