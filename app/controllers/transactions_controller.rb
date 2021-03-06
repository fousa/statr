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

    flash[:notice] = "Transaction created" unless @transaction.invalid?
    respond_with @transaction, :location => params[:continue].nil? ? new_transaction_path : transactions_path
  end

  def edit
    respond_with @transaction = current_user.transactions.find(params[:id])
  end

  def update
    @transaction = current_user.transactions.find params[:id], :readonly => false
    @transaction.update_attributes params[:transaction]

    flash[:notice] = "Transaction updated" unless @transaction.invalid?
    respond_with @transaction, :location => transactions_path
  end

  def destroy
    @transaction = current_user.transactions.find params[:id]
    @transaction.destroy

    flash[:notice] = "Transaction destroyed"
    respond_with @transaction
  end
end
