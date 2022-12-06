require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { Article.new(title: 'go') }
  before { subject.save }

  it 'Should have correct name' do
    title = 'go'
    expect(title).to eq(subject.title)
  end

  it 'Should have the name present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
end