class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :second_last_name
      t.string :first_last_name
      t.date :birth_date
      t.string :curp
      t.string :rfc
      t.integer :gender
      t.string :birth_state
      t.string :phone_number
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
