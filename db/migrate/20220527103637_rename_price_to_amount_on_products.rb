class RenamePriceToAmountOnProducts < ActiveRecord::Migration[6.1]
  def change
    rename_column :products, :price, :amount
  end
end
