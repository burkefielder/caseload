class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :triennial
      t.datetime :iep_date
      t.decimal :min_hours

      t.timestamps null: false
    end
  end
end
