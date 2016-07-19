class AddCardsAssociationToProject < ActiveRecord::Migration[5.0]
  def self.up
      add_column :cards, :project_id, :integer
      add_index 'cards', ['project_id'], :name => 'index_project_id'
  end

  def self.down
      remove_column :cards, :project_id
  end
end
