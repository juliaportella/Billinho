class AddStatusToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_column :enrollments, :status, :string
  end
end
