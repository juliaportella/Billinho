# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :enrollments

  validates :name, presence: true
  validates :modality, inclusion: { in: %w[University School Kindergarten] }
  validates :cnpj, numericality: { only_integer: true }, length: { is: 14 }, uniqueness: true, presence: true
end
