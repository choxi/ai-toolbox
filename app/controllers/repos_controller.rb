class ReposController < ApplicationController
  def index
    @repos = Repo.synced.by_popularity.all
    render :index, layout: false
  end

  def search
    @repos = Repo.synced.by_popularity.search_for(params[:query])
    render :index, layout: false
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
      flash.now[:error] = @repo.errors.full_messages.first
      render :new
    end
  end

  private

  def repo_params
    params.require(:repo).permit(:user, :name)
  end
end
