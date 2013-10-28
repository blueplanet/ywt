class Page < ActiveRecord::Base
  before_create :generate_token

  has_many :dids, -> { where(item_type: :y) }, class_name: 'YwtItem', dependent: :delete_all
  has_many :saweds, -> { where(item_type: :w) }, class_name: 'YwtItem', dependent: :delete_all
  has_many :tries, -> { where(item_type: :t) }, class_name: 'YwtItem', dependent: :delete_all

  has_many :ywts, class_name: "YwtItem"

  private
    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end
end
