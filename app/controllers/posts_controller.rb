class PostsController < ApplicationController
  include CurrentCart
  include SetModels

  before_action :set_need_attr
  before_action :set_cart

  def index
    @posts = Post.all.order('created_at DESC')
      .page(params[:page]).per(5)
  end

  def show
    @post = Post.find params[:id]
  end

end
