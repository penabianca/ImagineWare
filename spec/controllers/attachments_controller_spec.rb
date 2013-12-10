require 'spec_helper'

describe AttachmentsController do

=begin
  describe "GET 'show'" do
    before(:each) do
      @attachment = FactoryGirl.create(:attachment)
    end
    it "returns http success" do
      get 'show', id: @attachment
      response.should be_success
    end
  end
=end
  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
