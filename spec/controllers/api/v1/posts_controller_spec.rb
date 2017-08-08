
require "rails_helper"
require "redd"

RSpec.describe Api::V1::PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  # let!(:first_post) { Submission.create(id: 1, title: "Nike Air Force 1's on Sale! use code Shoes", link_flair: "[Deal/Sale]", created: '1502176403') }
  # let!(:second_post) { Submission.create(id: 2, title: "Review of GAP Selvedge Denim", link_flair: "[Review]", created: '1502231529') }

  describe "GET#all_posts" do
    it "should return a list of all the posts" do

      get :all_posts
      returned_json = JSON.parse(response.body)
binding.pry
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["title"]).to eq "Nike Air Force 1's on Sale! use code Shoes"
      expect(returned_json[0]["link_flair"]).to eq "[Deal/Sale]"
      expect(returned_json[0]["created"]).to eq "1502176403"

      expect(returned_json[1]["title"]).to eq "Review of GAP Selvedge Denim"
      expect(returned_json[1]["link_flair"]).to eq "[Review]"
      expect(returned_json[1]["created"]).to eq "1502231529"
    end
  end
end

