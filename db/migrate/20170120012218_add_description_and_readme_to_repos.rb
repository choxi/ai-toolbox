class AddDescriptionAndReadmeToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :description, :text
    add_column :repos, :readme, :text
  end
end
