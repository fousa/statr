class Category < ActiveRecord::Base
  belongs_to :user

  has_many :transactions, :dependent => :destroy

  validates :name, :presence => true

  has_friendly_id :name, :use_slug => true, :scope => :user_id

  before_destroy do
    unless transactions.empty?
      errors.add :base, "Category is used in one or more transaction" 
      false
    end
  end

  def self.options_for_select
    Category.all.map { |c| [c.name, c.id] }
  end
end
