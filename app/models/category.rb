class Category < ActiveRecord::Base
  belongs_to :user

  has_many :transactions, :dependent => :destroy

  validates :name, :presence => true

  def self.options_for_select
    Category.all.map { |c| [c.name, c.id] }
  end
end
