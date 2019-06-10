require "rails_helper"

describe "dashboard/show.html.erb" do
  context "when there is an active shop" do
    it "renders the shop's products" do
      assign(:shop, build(:shop))
      render
      expect(rendered).to have_content("Recent Sync Reports")
    end
  end
end
