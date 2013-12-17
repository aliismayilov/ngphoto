# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Ngphoto do
  describe '.fetch', :vcr do
    it 'fetches the latest photo of the day' do
      ngphoto = Ngphoto.fetch
      
      expect(ngphoto.url).to match /^http:\/\/images.nationalgeographic.com\/wpf\/media-live\/photos.*.jpg$/
      expect(ngphoto.title).not_to be_empty
    end
  end

  describe '#title' do
    subject(:title) { Ngphoto.new('title -- National Geographic Photo of the Day', 'url').title }

    it { should_not include('National Geographic Photo of the Day') }

    it { should_not include('--') }

    it { should_not include(' ')}

    it "does not have any uppercase letters" do
      expect(title).to eql(title.downcase)
    end

    it { should match /^#{Time.now.strftime('%Y-%m-%d-')}/ }
  end

  describe '#save' do
    it 'downloads and saves image in ~/Pictures/ngphoto' do
      ngphoto = Ngphoto.new 'title', 'url'

      ngphoto.save

      expect(File.delete("#{ENV['HOME']}/Pictures/ngphoto/#{ngphoto.title}.jpg")).not_to raise_error
    end
  end

  describe '.set' do
    it 'sets the image as wallpaper by image path'
  end
end
