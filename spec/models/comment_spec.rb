require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Database Table' do
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :email }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of :body}
  end

  context 'Associations' do
    it { is_expected.to belong_to :article}
  end
end
