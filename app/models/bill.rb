# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :value, :due_date, :status, presence: true
  validates :value, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: ['Open', 'Delayed', 'Paid'] }
end
