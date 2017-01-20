class ReposController < ApplicationController
  def index
    @repos = Repo.all
  end

  def search
    @repos = Repo.search_for(params[:query])
    render :index
  end
end
