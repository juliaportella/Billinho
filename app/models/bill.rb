# frozen_string_literal: true
class Bill < ApplicationRecord
  belongs_to :enrollment

  validates :value, :due_date, :status, presence: { message: 'é um campo obrigatório' }
  validates :value, numericality: { greater_than: 0, message: 'deve ser maior que 0' }
  validates :status, inclusion: { in: %w[Open Overdue Paid], message: 'deve ser Open, Overdue ou Paid' }

  after_create :change_bill_status


  def change_bill_status
    if due_date < Date.today && status == 'Open'
      update!(status: 'Overdue')
    end
  end

  def word_enrollment_translation
    "Matrícula #{enrollment.id}"
  end
end

