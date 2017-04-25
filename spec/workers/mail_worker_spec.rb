require "rails_helper"

RSpec.describe MailWorker, type: :worker do
  let(:user) { create(:user) }
  context "method" do
    it "add welcome_email to background jobs" do
      expect {
        work = MailWorker.new
        work.perform(user.id)
      }.to change(MailWorker.jobs, :size).by(1)
    end
  end
end
