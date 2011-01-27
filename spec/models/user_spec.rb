require 'spec_helper'

describe User do
  it {
    should have_many(:categories)
    should have_many(:transactions).through(:categories)
  }
end
