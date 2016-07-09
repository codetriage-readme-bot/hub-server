class CreateCardsUsersJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :cards_users, id: false do |t|
      t.integer "card_id"
      t.integer "user_id"
    end
    add_index :cards_users, [ "card_id", "user_id" ]
  end

  def down
    drop_table :cards_users
  end
end
