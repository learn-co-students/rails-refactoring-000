class GithubConnection
  attr_reader :username, :token
  
  def initialize(auth_data)
    @username = auth_data["username"]
    @token = auth_data["token"]   ### can be abstracted in controllers
  end

  # GET request to get user's organizations; method called on instance in the organizations controller
  def get_organizations
    OrganizationRequest.new(token: @token).get_orgs
  end

  # GET request to get all of an organization's repos; method called on instance in the organizations controller
  def get_repos(organization)
    RepoRequest.new(token: @token, organization: organization).get_repos
  end

  # GET request to get all of a repos issues; method called on instance in the repos controller
  def get_issues(organization, repo)
    IssuesRequest.new(token: @token, organization: organization, repo: repo).get_issues
   end

end