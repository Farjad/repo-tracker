class Image < Sequel::Model
  one_to_one :repo, :key => :repo_id, :primary_key => :repo_id
  one_to_one :repo_commit, :key => :commit_id, :primary_key => :commit_id
  plugin :timestamps, :create => :ctime, :update => :mtime, :force => true, :update_on_create => true
end