class ReposController < ApplicationController
  def index
    @repos = Repo.synced.by_popularity.all
    render :index, layout: false
  end

  def search
    @repos = Repo.synced.by_popularity.search_for(params[:query])
    render :index
  end

  def new
    @repo = Repo.new
  end

  def create
    @repo = Repo.new(repo_params)

    if @repo.save
      flash[:success] = "Submitted Repo."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def repo_params
    params.permit(:user, :name)
  end
end
