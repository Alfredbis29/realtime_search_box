require "rails_helper"

RSpec.describe Article, type: :model do
  subject { Post.new(title: "go", description: "how to cook chiken") }

  before { subject.save }

  it "name should not be empty" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Title must not exceed 250 characters" do
    subject.title = [1..300]
    expect(subject).to_not be_valid
  end

  it "Description should not be empty." do
    subject.Description =  nil
    expect(subject).to_not be_valid
  end
end
