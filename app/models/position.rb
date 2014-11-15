class Position < ActiveRecord::Base
  belongs_to :article, inverse_of: :positions

  validates :article, presence: true
  validates :user_ip, presence: true, format: { with: Resolv::IPv4::Regex }
  validates :offset, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
