class CreateBills
  def initialize(enrollment)
    @enrollment = enrollment
  end

  def perform
    validate!
    generate_bills
  end

  private

  def validate!
    raise 'O valor do curso deve ser superior a 0' unless @enrollment.course_value.positive?
    raise 'A quantidade de parcelas deve ser superior a 0' unless @enrollment.quantity_bills.positive?
    raise 'O dia de vencimento deve ser entre 1 e 31' unless @enrollment.due_day.between?(1, 31)
  end

  def generate_bills
    value_each_bill = @enrollment.course_value / @enrollment.quantity_bills

    base_date = @enrollment.created_at.to_date
    index = @enrollment.due_day <= base_date.day ? 1 : 0

    @enrollment.quantity_bills.times do
      due_date = calculate_due_date(base_date, index)

      Bill.create!(
        value: value_each_bill,
        due_date: due_date,
        status: 'Open',
        enrollment_id: @enrollment.id
      )

      index += 1
    end
  end

  def calculate_due_date(base_date, index)
    due_date = base_date.next_month(index)

    if Date.valid_date?(due_date.year, due_date.month, @enrollment.due_day)
      due_date.change(day: @enrollment.due_day)
    else
      due_date.end_of_month
    end
  end
end
