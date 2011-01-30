class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable

  has_many :categories,   :dependent => :destroy
  has_many :transactions, :through => :categories

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
