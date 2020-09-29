class AddColumnMerchandisingToOperas < ActiveRecord::Migration[6.0]
  def change
    add_column :acquistos, :merchandising, :boolean
  end
end
