class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable

  has_many :categories, :dependent => :destroy

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
