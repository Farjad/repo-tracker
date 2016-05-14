class App < Sinatra::Application
  get '/Repos' do
    content_type :json
    repos = Repo.all
    json_display repos
  end

  get %r{/Repos/(\d+)$} do |repo_id|
    content_type :json
    repo = Repo.where(:repo_id => repo_id)
    json_display repo.first
  end
end