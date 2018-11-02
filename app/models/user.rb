class User < ActiveRecord::Base
  has_many :tweets

  def slug
    self.username.gsub((/\W/), "-").downcase
  end

end
