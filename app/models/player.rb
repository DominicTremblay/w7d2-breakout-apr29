class Player < ActiveRecord::Base
  has_many :messages
  has_many :channel_memberships
  has_many :channels, through: :channel_memberships

  validates :username, presence: true, uniqueness: true, length: {minimum: 6, maximum: 30}
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i}
  validates :password, presence: true, length: {minimum: 6}
  validates :points, presence: true, numericality: {only_integers: true, greater_or_equal_to: 0}

  validate :cheated?

  before_save :email_downcase

  def cheated?
    errors.add(:points, "is over 1m, you cheated!!") unless points < 1000000
  end

  def email_downcase
    self.email = email.downcase
  end

end

