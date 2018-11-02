class User < ActiveRecord::Base
  has_many :tweets

  def slug
    self.username.gsub((/\W/), "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|username| username.slug == slug}
  end

end
