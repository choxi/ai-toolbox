class ReposController < ApplicationController
  def index
    @repos = Repo.synced.by_popularity.all
  end

  def search
    @repos = Repo.synced.by_popularity.search_for(params[:query])
    render :index
  end
end
