class AddPlayerToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :player, foreign: true
  end
end
