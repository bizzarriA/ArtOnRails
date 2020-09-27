class ChangeTypeAnnoOpera < ActiveRecord::Migration[6.0]
  def change
    change_column :operas, :anno, :integer
  end
end
