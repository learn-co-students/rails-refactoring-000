module ApplicationHelper

  def initialize(attr)
    @token = attr[:token]
    @organization ||= attr[:organization]
    @repo ||= attr[:repo]
  end

  def set_url(organization: nil, repo: nil)
    if organization && repo
        "repos/#{organization}/#{repo}/issues"
      elsif organization
        "orgs/#{organization}/repos"
      else
        "user/orgs"
    end
  end

  def run_request(token, organization: nil, repo: nil) # turn these into a hash, or is it public API stuff
    url_end = set_url(organization: organization, repo: repo)
    request = Typhoeus::Request.new(
      "https://api.github.com/" + url_end,
      headers: {Authorization: "token #{token}"}
      )
    request.run
  end

  def parse_response(lambda)
    JSON.parse(@response.body).map(&lambda)
  end

end
