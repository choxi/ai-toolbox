class ReposController < ApplicationController
  def index
    @repos = Repo.all
  end

  def search
    @repos = Repo.all.limit(1)
    render :index
  end
end
