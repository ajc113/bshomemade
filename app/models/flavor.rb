class Flavor < ApplicationRecord
belongs_to :bee
mount_uploader :image, ImageUploader



  def self.descriptions
    pluck(:description).flatten.join(' ')
  end

  def self.names
    pluck(:name).flatten.join(' ')
  end

    def self.images
    pluck(:image).flatten.join(' ')
  end

  def self.search(search)
    if search
      self.where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
    else
      self.all
    end
  end
end