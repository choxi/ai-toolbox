Github.configure do |c|
  c.client_id        = ENV["github_client_id"]
  c.client_secret    = ENV["github_client_secret"]
end
