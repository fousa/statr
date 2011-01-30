class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    respond_with @transactions = current_user.transactions
  end

  def new
    respond_with @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new params[:transaction]
    @transaction.save

    respond_with @transaction, :location => transactions_path
  end

  def edit
    respond_with @transaction = current_user.transactions.find(params[:id])
  end

  def update
    @transaction = current_user.transactions.find params[:id]
    @transaction.update_attributes params[:transaction]

    respond_with @transaction
  end

  def destroy
    @transaction = current_user.transactions.find params[:id]
    @transaction.destroy

    respond_with @transaction
  end
end
