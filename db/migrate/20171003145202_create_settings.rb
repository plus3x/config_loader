class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :name, null: false, index: true
      t.string :value, null: false

      t.timestamps null: false
    end
  end
end
