require "rails_helper"
RSpec.describe User, type: :model do
  subject { User.new(email: "g@gmail.com", password: "123456") }

  before { subject.save }

  it "email should not be empty" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "article must be greater than or equal to zero." do
    subject.article_counter = -1
    expect(subject).to_not be_valid
  end
end
