class CreateCardsProjectsJoin < ActiveRecord::Migration[5.0]
  def up
    create_table :cards_projects, id: false do |t|
      t.integer "card_id"
      t.integer "project_id"
    end
    add_index :cards_projects, [ "card_id", "project_id" ]
  end

  def down
    drop_table :cards_projects
  end
end
