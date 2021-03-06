require "rails_helper"

RSpec.describe User, type: :model do
  context "method" do
    it "check if is admin" do
      user = create(:admin)
      expect(user.admin?).to eq(true)
    end
    it "short email" do
      user = create(:admin)
      expect(user.short_email).to eq('admin')
    end
    it "add welcome_email to background jobs" do
      expect {
        create(:user)
      }.to change(MailWorker.jobs, :size).by(1)
    end
  end
end
