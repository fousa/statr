class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = current_user.transactions.order("executed_at DESC").limit(10)
    @income_this_month = current_user.transactions.for_month(current_date).incomings.sum(:amount)
    @expenses_this_month = current_user.transactions.for_month(current_date).expenses.sum(:amount)
  end
end
