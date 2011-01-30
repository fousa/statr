class Transaction < ActiveRecord::Base
  belongs_to :category

  validates :category,    :presence => true
  validates :executed_at, :presence => true
  validates :amount,      :presence => true

  default_value_for :executed_at, Date.today
end
