require 'spec_helper'

describe Category do
  it {
    should belong_to(:user)
    should validate_presence_of(:name)
  }
end
