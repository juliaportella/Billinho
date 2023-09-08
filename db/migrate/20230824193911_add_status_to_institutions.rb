class AddStatusToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :status, :string
  end
end
