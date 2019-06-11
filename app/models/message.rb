class Message < ActiveRecord::Base

  belongs_to :player

  validates :title, :content, :url, :player,  presence: true

  
end