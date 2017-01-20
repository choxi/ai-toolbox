class Repo < ApplicationRecord
  include PgSearch
  pg_search_scope :search_for, against: %i(name user description readme), using: {
    tsearch: { prefix: true },
    trigram: {},
    dmetaphone: {}
  }

  scope :synced, -> { where("description IS NOT NULL") }

  def github_url
    "https://github.com/#{self.user}/#{self.name}"
  end

  def update_stats
    repo_params = { user: self.user, repo: self.name }

    github_repo     = Github.repos.get(repo_params)
    commit_activity = Github.repos.stats.commit_activity(repo_params)
    readme          = Base64.decode64(Github.repos.contents.readme(repo_params).content)

    self.update_attributes!({
      description: github_repo.description,
      readme: readme,
      forks_count: github_repo.forks_count,
      stargazers_count: github_repo.stargazers_count,
      watchers_count: github_repo.watchers_count,
      subscribers_count: github_repo.subscribers_count,
      github_created_at: github_repo.created_at,
      commit_activity: commit_activity.to_json
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

  def commit_activity
    @json_commit_activity ||= JSON.parse(self[:commit_activity])
  end
end
