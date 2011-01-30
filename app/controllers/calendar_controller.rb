class CalendarController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = current_user.transactions
    @date = params[:month] ? Date.parse(params[:month]) : Date.today 
  end
end
