class Repo < Sequel::Model
  one_to_many :repo_commits, :key => :repo_id, :primary_key => :repo_id
  one_to_many :images, :key => :repo_id, :primary_key => :repo_id
  plugin :timestamps, :create => :ctime
end