class AddMerchandisingToOpera < ActiveRecord::Migration[6.0]
  def change
    add_column :operas, :merchandising, :boolean
  end
end
