class RemoveUsernamePlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :username, :string
  end
end
