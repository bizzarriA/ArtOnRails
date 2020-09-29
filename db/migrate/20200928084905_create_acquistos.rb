class CreateAcquistos < ActiveRecord::Migration[6.0]
  def change
    create_table :acquistos do |t|

      t.timestamps
    end

    add_reference :acquistos, :opera, foreign_key: true
    add_reference :acquistos, :user, foreign_keys: true
    add_reference :acquistos, :pagamento, foreign_keys: true

  end
end
