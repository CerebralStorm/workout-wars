require 'spec_helper'

describe "Activities" do
  describe "GET /activities" do
    it "should return the html" do
      get activities_path
      response.status.should be(302)
    end
  end
end
