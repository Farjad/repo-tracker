require 'pry'
class App < Sinatra::Application
  get %r{/Repos/(\d+)/Commits$} do |repo_id|
    content_type :json
    commits = Repo.where(Sequel.qualify(:repos, :repo_id) => repo_id)
               .association_join(:repo_commits)
               .join(:images, Sequel.qualify(:repo_commits, :commit_id) => Sequel.qualify(:images, :commit_id))
               .all

    json_display commits
  end

  get %r{/Repos/(\d+)/Commits/([A-Za-z0-9]+)$} do |repo_id, commit|
    content_type :json
    commit = RepoCommit.where(Sequel.qualify(:repo_commits, :repo_id) => repo_id, :commit => commit)
                 .association_join(:repo)
                 .association_join(:image)

    json_display commit.first
  end
end