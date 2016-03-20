class AddDetailsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :age, :datetime
    add_column :students, :grade, :integer
    add_column :students, :diagnosis, :string
    add_column :students, :dismissed, :boolean
  end
end
