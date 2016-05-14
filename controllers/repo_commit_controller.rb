class App < Sinatra::Application
  get %r{/Repos/(\d+)/Commits$} do |repo_id|
    content_type :json
    repo = Repo.where(:repo_id => repo_id)

    commits = nil
    commits = repo.first.repo_commits if repo.count == 1

    json_display commits
  end

  get %r{/Repos/(\d+)/Commits/([A-Za-z0-9]+)$} do |repo_id, commit|
    content_type :json
    commit = RepoCommit.where(Sequel.qualify(:repo_commits, :repo_id) => repo_id, :commit => commit).association_join(:repo)

    json_display commit.first
  end
end