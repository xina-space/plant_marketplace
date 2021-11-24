class AddAddressToPlants < ActiveRecord::Migration[6.0]
  def change
    add_column :plants, :address, :string
  end
end
