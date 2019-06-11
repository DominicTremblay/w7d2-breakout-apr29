class CreateChannelMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_memberships do |t|
      t.references :channel, foreign: true
      t.references :player, foreign: true
    end
  end
end
