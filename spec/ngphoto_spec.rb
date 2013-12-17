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
    let(:ngphoto) { Ngphoto.new 'title -- National Geographic Photo of the Day', 'url' }

    it "does not include National Geographic Photo of the Day" do
      expect(ngphoto.title).not_to include('National Geographic Photo of the Day')
    end

    it "does not include double dashes" do
      expect(ngphoto.title).not_to include('--')
    end

    it "does not include any whitespace" do
      expect(ngphoto.title).not_to include(' ')
    end

    it "does not have any uppercase letters" do
      expect(ngphoto.title).to eql(ngphoto.title.downcase)
    end
  end

  describe '#save' do
    it 'downloads and saves image in ~/Pictures/ngphoto' do
      ngphoto = Ngphoto.new 'title', 'url'

      Kernel.stub system: true

      ngphoto.save

      expect(Kernel).to receive(:system).with('curl -o ~/Pictures/ngphoto/title.jpg url')
    end
  end

  describe '.set' do
    it 'sets the image as wallpaper by image path'
  end
end
