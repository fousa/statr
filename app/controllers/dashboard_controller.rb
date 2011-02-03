class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = current_user.transactions.order("executed_at DESC").limit(10)
    @income_this_month = current_user.transactions.for_this_month.incomings.sum(:amount)
    @expenses_this_month = current_user.transactions.for_this_month.expenses.sum(:amount)

    @leftover = Transaction.leftover_from(@income_this_month, @expenses_this_month)
    @average = Transaction.average_from(@income_this_month, @expenses_this_month)
  end
end
