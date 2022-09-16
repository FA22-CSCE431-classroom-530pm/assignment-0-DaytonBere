# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', author: 'jk rowling', price: 6.98, published_date: 1997-6-7)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an author' do
        subject.title = 'harry potter'
        subject.author = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a price' do
        subject.author = 'jk rowling'
        subject.price = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a published date' do
        subject.price = 6.98
        subject.published_date = nil
        expect(subject).not_to be_valid
    end
end