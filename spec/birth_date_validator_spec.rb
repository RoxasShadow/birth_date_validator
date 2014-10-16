require './spec_helper'

describe BirthDateValidator do
  describe 'user has to have at least 18 years' do
    context '18 years old' do
      it 'is valid' do
        expect(TestUserOverAge.new(birth_date: 18.years.ago)).to be_valid
        expect(BirthDateValidator.valid?(18.years.ago, at_least: 18.years.ago)).to be_truthy
      end
    end

    context '19 years old' do
      it 'is valid' do
        expect(TestUserOverAge.new(birth_date: 19.years.ago)).to be_valid
      end
    end

    context '17 years old' do
      subject { TestUserOverAge.new(birth_date: 17.years.ago) }
      before { subject.valid? }

      it 'is not valid' do
        expect(subject).to_not be_valid
        expect(subject.errors[:birth_date][0]).to include 'older'
      end
    end
  end

  describe 'user has to have less then 18 years' do
    context '17 years old' do
      it 'is valid' do
        expect(TestUserUnderAge.new(birth_date: 17.years.ago)).to be_valid
      end
    end

    context '19 years old' do
      it 'is not valid' do
        expect(TestUserUnderAge.new(birth_date: 19.years.ago)).to_not be_valid
      end
    end

    context '18 years old' do
      it 'is not valid' do
        expect(TestUserUnderAge.new(birth_date: 18.years.ago)).to_not be_valid
      end
    end
  end

  describe 'user has to have from 18 and 30 years' do
    context '30 years old' do
      it 'is valid' do
        expect(TestUserRange.new(birth_date: 30.years.ago)).to be_valid
      end
    end

    context '17 years old' do
      it 'is not valid' do
        expect(TestUserRange.new(birth_date: 17.years.ago)).to_not be_valid
      end
    end

    context '31 years old' do
      it 'is not valid' do
        expect(TestUserRange.new(birth_date: 31.years.ago)).to_not be_valid
      end
    end
  end
end
