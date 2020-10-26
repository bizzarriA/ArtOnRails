class ChangeNumericToStringPagamento < ActiveRecord::Migration[6.0]
  def change
    change_column :pagamentos, :numero, :string
    change_column :pagamentos, :mese, :integer
    change_column :pagamentos, :anno, :integer
    change_column :pagamentos, :cvv, :string
  end
end
