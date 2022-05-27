class AddCurrencyAndShowCountToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :currency, :string
    add_column :products, :show_count, :integer, default: 0
  end
end
