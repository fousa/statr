class Category < ActiveRecord::Base
  belongs_to :user

  has_many :transactions, :dependent => :destroy

  validates :name, :presence => true

  has_friendly_id :name, :use_slug => true, :scope => :user_id

  def self.options_for_select
    Category.all.map { |c| [c.name, c.id] }
  end
end
