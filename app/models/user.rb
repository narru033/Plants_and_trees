class User < ActiveRecord::Base

  has_many :attachments

  validates :name, :email, :address, :city, :state, :country, presence: true
  validates :zip_code, length: { minimum: 3 }, allow_blank: true

  geocoded_by :location
  after_validation :geocode

  def location
    "#{self.address}, #{city}, #{state}, #{zip_code}, #{country}"
  end

end
