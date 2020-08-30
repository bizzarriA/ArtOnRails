class CreateCompratores < ActiveRecord::Migration[6.0]
  def change
    create_table :compratores do |t|

      t.timestamps
    end
  end
end
