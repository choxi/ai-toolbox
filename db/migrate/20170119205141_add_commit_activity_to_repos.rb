class AddCommitActivityToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :commit_activity, :text
  end
end
