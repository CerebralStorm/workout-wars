require 'spec_helper'

describe "Competitions" do
  describe "GET /competitions" do
    it "should return the html" do
      get competitions_path
      response.status.should be(302)
    end
  end
end
