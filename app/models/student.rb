# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :enrollments

  validates :name, :phone, :gender, :payment_method, :birthdate, presence: true
  validates :cpf, numericality: { only_integer: true },
                  length: { is: 11, message: 'deve conter 11 numeros, sem simbolos ou espaços.' }, uniqueness: true, presence: true
  validates :phone, format: /\A\(\d{2}\) [2-9]\d{4}-\d{4}\z/
  validates :gender, inclusion: { in: %w[F M] }
  validates :payment_method, inclusion: { in: %w[Boleto Cartão] }
end
