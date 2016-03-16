class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    # binding.pry
    self.create(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"],
      :username => auth["info"]["nickname"],
      :token => auth["credentials"]["token"]
    )
  end

end

