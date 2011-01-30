class CalendarController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = current_user.transactions

    @date = current_date(params[:year], params[:month])
  end
end
