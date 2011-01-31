require 'spec_helper'

describe Category do
  it {
    should belong_to(:user)
    should have_many(:transactions)
    should validate_presence_of(:name)
  }

  it "can not be deleted when transactions available" do
    user = User.create(:email => "jelle@fousa.be", :password => "123123", :password_confirmation => "123123")
    category = Category.create(:name => "test")
    user.categories << category
    transaction = Transaction.create(:executed_at => Date.today, :amount => 10)
    category.transactions << transaction
    category.transactions.count.should equal 1

    category.destroy
    Category.count.should equal 1
  end

  it "can be deleted when transactions available" do
    user = User.create(:email => "jelle@fousa.be", :password => "123123", :password_confirmation => "123123")
    category = Category.create(:name => "test")
    user.categories << category

    category.destroy
    Category.count.should equal 0
  end
end
