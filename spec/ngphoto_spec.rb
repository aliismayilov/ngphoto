require 'ngphoto'

describe Ngphoto do
  describe '.find_photo_url' do
    it 'finds url of the photo of the day'
  end

  describe '.save' do
    it 'downloads and saves image by url in ~/Pictures/ngphoto'
  end

  describe '.set' do
    it 'sets the image as wallpaper by image path'
  end
end
