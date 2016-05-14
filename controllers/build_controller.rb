require 'git_clone_url'

class App < Sinatra::Application
  post '/build' do
    data = do_creation

    json_display data
  end

  post '/complete' do
    data = do_creation

    data.update(:complete => :true) unless data == 400

    json_display data
  end

  private

  def do_creation
    request.body.rewind
    data = parse_json(request.body.read)

    if data.is_a?(Hash) && data.any?
      if data.has_key?('repo_url') && data.has_key?('commit') && data.has_key?('registry') && data.has_key?('namespace')

        path = get_git_path(data['repo_url'])
        repo = create_repo_if_not_exist(path)
        commit = create_commit_if_not_exist(repo, data['commit'])
        image = create_image_if_not_exist(repo, commit, data['registry'], data['namespace'])

        data = image
      else
        data = 400
      end
    end

    data
  end

  def get_git_path(repo_url)
    url = GitCloneUrl.parse(repo_url)
    path = url.path
    path[0] = '' if path[0] == '/'

    path
  end

  def create_repo_if_not_exist(repo_url)
    repo = Repo.where(:repo_url => repo_url).first

    if repo.nil?
      match = /.*?\/(.*?)\.git/.match(repo_url)
      name = match[1]
      repo = Repo.create(:repo_name => name, :repo_url => repo_url)
    end

    repo
  end

  def create_commit_if_not_exist(repo, commit)
    commit_entry = RepoCommit.where(:repo_id => repo[:repo_id], :commit => commit).first

    commit_entry = RepoCommit.create(:repo_id => repo[:repo_id], :commit => commit) if commit_entry.nil?

    commit_entry
  end

  def create_image_if_not_exist(repo, commit, registry, namespace)
    image = Image.where(:repo_id => repo[:repo_id], :commit_id => commit[:commit_id]).first

    image = Image.create(:repo_id => repo[:repo_id], :commit_id => commit[:commit_id], :registry => registry, :namespace => namespace) if image.nil?

    image
  end

  def parse_json(body)
    begin
      data = JSON.parse(body)
    rescue StandardError
      data = {}
    end

    data
  end
end