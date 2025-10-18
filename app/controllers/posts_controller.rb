class PostsController < ApplicationController
  def index
    # エラー: @postではなく@postsであるべき
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # エラー1: paramsの取得方法が間違っている（strong parametersを使っていない）
    @post = Post.new(params[:post])

    # エラー2: saveの結果を確認していない、常にshowにリダイレクト
    @post.save
    redirect_to post_path(@post)
  end

  def show
    # エラー: findの引数が間違っている（params[:id]であるべき）
    @post = Post.find(params[:post_id])
  end

  private

  # このメソッドは定義されているが、createアクションで使われていない
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
