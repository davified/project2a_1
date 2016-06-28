class UsershomeController < ApplicationController
  def index
    @posts = Post.all
  end
end
