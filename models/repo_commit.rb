class RepoCommit < Sequel::Model
  one_to_one :repo, :key => :repo_id, :primary_key => :repo_id
  one_to_one :image, :key => :commit_id, :primary_key => :commit_id
end