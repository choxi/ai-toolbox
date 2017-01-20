class ReposController < ApplicationController
  def index
    @repos = Repo.synced.all
  end

  def search
    @repos = Repo.synced.search_for(params[:query])
    render :index
  end
end
