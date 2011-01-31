class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = current_user.transactions.order("executed_at DESC").limit(10)
  end
end
