class Repo < ApplicationRecord
  def update_stats
    github_repo = Github.repos.get({
      user: self.user,
      repo: self.name
    })

    self.update_attributes!({
      forks_count: github_repo.forks_count,
      stargazers_count: github_repo.stargazers_count,
      watchers_count: github_repo.watchers_count,
      subscribers_count: github_repo.subscribers_count,
      github_created_at: github_repo.created_at
    })
  end

  def self.update_stats
    Repo.all.each do |repo|
      begin
        repo.update_stats
      rescue => e
        puts e
      end
    end
  end
end
