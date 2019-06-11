class Channel < ActiveRecord::Base

  has_many :channel_memberships
  has_many :players, through: :channel_memberships
end