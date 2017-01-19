class AddStatsToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :forks_count,        :integer
    add_column :repos, :stargazers_count,   :integer
    add_column :repos, :watchers_count,     :integer
    add_column :repos, :subscribers_count,  :integer
    add_column :repos, :github_created_at,  :timestamp
  end
end
