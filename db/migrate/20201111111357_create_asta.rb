class CreateAsta < ActiveRecord::Migration[6.0]
  def change
    create_table :asta do |t|

      t.timestamps
    end
  end
end
