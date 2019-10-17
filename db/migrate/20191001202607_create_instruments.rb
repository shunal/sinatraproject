class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :instrument_type
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
