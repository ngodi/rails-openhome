class Room < ApplicationRecord
  belongs_to :user
  has_many_attached :images, :dependent => :destroy
  has_many :reservations
  has_many :reviews

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 500}
  validates :address, presence: true

  validate :image_type

  def thumb_nail input
    self.images[input].variant(resize: '200x200!').processed
  end

  private

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing")
    end
    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png))
        errors.add(:images, 'Image must be a JPEG or PNG')
      end
    end
  end
end
