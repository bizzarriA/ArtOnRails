class AddUrlOnOpera < ActiveRecord::Migration[6.0]
  def change
    add_column :operas, :url, :string
  end
end
