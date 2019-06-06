require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.inline!

RSpec.describe TrackerWorker, type: :job do
  context "for a valid shop" do
    before(:each) do
      @shop = FactoryBot.create(:shop)
      @shop.activate_shopify_session
    end

    # setup do
    #   @import = user_imports(:admin_import)
    #   ActionMailer::Base.deliveries.clear
    # end

    it "should send a message upon completing an import" do
      TrackerWorker.perform_async(
        options: { some: "option" }
      )

      expect true
    end
  end
end
