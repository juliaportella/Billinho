# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birthdate
      t.string :phone
      t.string :gender
      t.string :payment_method

      t.timestamps
    end
  end
end
