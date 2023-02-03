require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'database columns' do
    context 'be sure columns are present' do
      it { should have_db_column(:title).of_type(:string) }
      it { should have_db_column(:priority).of_type(:string) }
      it { should have_db_column(:content).of_type(:text) }
    end

    context 'indexes' do
      it { should have_db_index(:user_id) }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:content) }
  end

  describe 'factories' do
    it 'should have a valid factory' do
      expect(build(:note)).to be_valid
    end
  end

  describe 'create note' do
    context 'successfully' do
      let(:note) { create(:note) }

      it 'should create a note' do
        expect(note).to be_valid
      end
    end

    context 'failure' do
      let(:note) { create(:note, title: nil) }
      let(:note2) { create(:note, priority: nil) }
      let(:note3) { create(:note, content: nil) }

      it 'should not create a note without title' do
        expect { note }.to raise_error(ActiveRecord::RecordInvalid)
      end
      it 'should not create a note without priority' do
        expect { note2 }.to raise_error(ActiveRecord::RecordInvalid)
      end
      it 'should not create a note without content' do
        expect { note3 }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
