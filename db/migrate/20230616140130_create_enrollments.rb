# frozen_string_literal: true

class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :institution, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.string :course
      t.integer :quantity_bills
      t.integer :due_day
      t.decimal :course_value

      t.timestamps
    end
  end
end
