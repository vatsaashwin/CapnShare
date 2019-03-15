class CreateDonates < ActiveRecord::Migration[5.2]
  def change
    create_table :donates do |t|
      t.string :shelter_name
      t.string :shelter_address
      t.string :shelter_website
      t.string :shelter_contact
      t.string :shelter_email
    end
  end
end
