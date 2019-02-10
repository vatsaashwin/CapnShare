class AddExpiryDateToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :expiry_date, :string
  end
end
