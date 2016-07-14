class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def self.make_admin(email)
    user = User.find_by_email(email)
    user.update_attribute :admin, true
  end
end
