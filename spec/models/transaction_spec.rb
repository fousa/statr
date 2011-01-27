require 'spec_helper'

describe Transaction do
  it {
    should belong_to(:category)
    should validate_presence_of(:category)
    should validate_presence_of(:executed_at)
    should validate_presence_of(:amount)
  }
end
