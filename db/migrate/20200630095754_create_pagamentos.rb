class CreatePagamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :pagamentos do |t|
      t.numeric :numero
      t.numeric :mese
      t.numeric :anno
      t.numeric :cvv
      t.string :intestatario

      t.timestamps
    end
  end
end
