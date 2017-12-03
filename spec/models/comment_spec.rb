require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Database Table' do
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :email }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :body}
    it { is_expected.to allow_value("", nil).for :email }

    describe 'email' do
      let(:article) { FactoryBot.create(:article) }
      subject { FactoryBot.create(:comment, article: article) }
      ['test @random.se', 'test@random', 'testrndom.se', 'test@random.x'].each do |email|
        it "validates invalid format #{email}" do
          subject.email = email
          expect(subject).to_not be_valid
        end
      end

      ['test@random.se', 'test@random.com', 'tret@rndommail.se'].each do |email|
        it "validates valid format #{email}" do
          subject.email = email
          expect(subject).to be_valid
        end
      end
    end

  end

  context 'Associations' do
    it { is_expected.to belong_to :article}
  end
end
