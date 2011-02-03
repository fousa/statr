class Transaction < ActiveRecord::Base
  belongs_to :category

  validates :category,    :presence => true
  validates :executed_at, :presence => true
  validates :amount,      :presence => true

  default_value_for :executed_at, Date.today

  scope :incomings, joins(:category).where("categories.income = ?", true)
  scope :expenses, joins(:category).where("categories.income = ?", false)
  scope :for_month, lambda { |date|
    where(:executed_at => date.beginning_of_month..date.end_of_month)
  }
  scope :for_this_month, lambda { for_month(Time.zone.now) }

  def self.leftover_from(incomings, expenses)
    incomings - expenses
  end

  def self.average_from(incomings, expenses)
    self.leftover_from(incomings, expenses) / 28
  end
end
