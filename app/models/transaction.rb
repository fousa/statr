class Transaction < ActiveRecord::Base
  belongs_to :category

  validates :category,    :presence => true
  validates :executed_at, :presence => true
  validates :amount,      :presence => true
end
