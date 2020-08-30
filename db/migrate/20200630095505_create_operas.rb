class CreateOperas < ActiveRecord::Migration[6.0]
  def change
    create_table :operas do |t|
      t.string :titolo
      t.string :tecnica
      t.numeric :anno

      t.timestamps
    end
  end
end
