require 'ngphoto'

describe Ngphoto do
  describe '.fetch' do
    it 'fetches the latest photo of the day' do
      ngphoto = Ngphoto.fetch
      
      expect(ngphoto.url).to match /^http:\/\/images.nationalgeographic.com\/wpf\/media-live\/photos.*.jpg$/
      expect(ngphoto.title).not_to be_empty
    end
  end

  describe '.save' do
    it 'downloads and saves image by url in ~/Pictures/ngphoto'
  end

  describe '.set' do
    it 'sets the image as wallpaper by image path'
  end
end
