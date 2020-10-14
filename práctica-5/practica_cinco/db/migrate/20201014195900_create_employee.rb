class CreateEmployee < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :e_number
      t.references :office, null: false, foreign_key: { to_table: :offices }
    end
  end
end
