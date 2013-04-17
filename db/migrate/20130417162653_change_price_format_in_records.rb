class ChangePriceFormatInRecords < ActiveRecord::Migration
  def change
    change_column :records, :price, :decimal, :precision => 10, :scale => 2
  end
end
