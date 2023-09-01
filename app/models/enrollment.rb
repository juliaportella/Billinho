# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :bills

  validates :status, inclusion: { in: %w[Active Canceled Locked] }


  after_create :create_bills

  def perform
    validade!
  end

  def create_bills
    value_each_bill = course_value / quantity_bills
    base_date = Date.today
    index = due_day <= base_date.day ? 1 : 0

    quantity_bills.times do
      due_date = calculate_due_date(base_date, index)

      Bill.create!(
        value: value_each_bill,
        due_date: due_date,
        status: 'Open',
        enrollment_id: id
        )

      index += 1
    end
  end

  private

  def calculate_due_date(base_date, index)
    due_date = base_date.next_month(index)

    if Date.valid_date?(due_date.year, due_date.month, due_day)
      due_date.change(day: due_day)
    else
      due_date.end_of_month
    end
  end

  def validade!
    raise 'O course_value deve ser superior a 0' unless course_value.positive?
    raise 'A quantidade de parcelas deve ser superior a 0' unless quantity_bills.positive?
    raise 'O dia de vencimento deve ser entre 1 e 31' unless due_day.between?(1, 31)
    raise 'As informações do curso, número de mensalidades, dia de vencimento e valor do curso devem existir' if course.blank? || quantity_bills.blank? || due_day.blank? || course_value.blank?
    end
end

