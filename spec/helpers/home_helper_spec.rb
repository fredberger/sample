require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  describe "nav link" do
    it "active" do
      params[:controller] = "admin/home"
      expect(helper.active_link("admin/home")).to eq("active")
    end
    it "not active" do
      params[:controller] = "dashboard/home"
      expect(helper.active_link("admin/home")).to eq("")
    end
  end
end
