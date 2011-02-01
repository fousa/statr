class Transaction < ActiveRecord::Base
  belongs_to :category

  validates :category,    :presence => true
  validates :executed_at, :presence => true
  validates :amount,      :presence => true

  default_value_for :executed_at, Date.today

  scope :incomings, joins(:category).where("categories.income = ?", true)
  scope :expenses, joins(:category).where("categories.income = ?", false)
end
