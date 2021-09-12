require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:uuid) }
    it { should validate_presence_of(:recipient_name) }
    it { should validate_presence_of(:badge_issue_date) }

    it 'should invalidate a bad uuid' do
      subject = described_class.new(uuid: 'abcd', recipient_name: 'Josh', badge_issue_date: '2014-01-02')
      expect(subject.valid?).to be(false)
      expect(subject.errors.map { |e| e.message }.include?('UUID is not valid')).to be(true)
    end
  end
end
