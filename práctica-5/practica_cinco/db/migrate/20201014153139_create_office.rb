class CreateOffice < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name, limit: 255, null: false
      t.string :phone_number, limit: 30, null: false
      t.text :adress
      t.boolean :available, null: false, default: false
    end
  end
end
