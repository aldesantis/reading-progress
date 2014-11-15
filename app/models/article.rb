class Article < ActiveRecord::Base
  has_many :positions, inverse_of: :article, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
end
