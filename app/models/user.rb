class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  before_create :humanize_attributes
  before_save :hash_gravatar

  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :first_name
  validates_presence_of :last_name

  def self.login(username, password, request)
    user = User.find_by_username username
    if user && user.valid_password?(password)
      user.update_tracked_fields! request
      user
    else
      false
    end
  end

  private

  def hash_gravatar
    self.gravatar = Digest::MD5.hexdigest email
  end

  def humanize_attributes
    self.first_name = first_name.humanize
    self.last_name = last_name.humanize
  end
end
