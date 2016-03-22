class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.datetime :date
      t.integer :minutes
      t.text :notes
      t.string :therapy
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
