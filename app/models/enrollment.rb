class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :bills

  validates :course, :quantity_bills, :due_day, :course_value, presence: true
  validates :course_value, comparison: { greater_than: 0 }
  validates :quantity_bills, comparison: { greater_than: 0 }
  validates :due_day, inclusion: { in: 1..31, message: 'Due date must be between the 1st and the 31st' }

  after_create :create_bills

  def create_bills
    value_each_bill = course_value / quantity_bills
    base_date = Date.today
    index = due_day <= base_date.day ? 1 : 0 # primeiro retorna o true e depois o false
  
    quantity_bills.times do  #é apenas um contador, de 0 até x
      due_date = base_date.next_month(index)
      
      due_date =
        if Date.valid_date?(due_date.year, due_date.month, due_day)
          due_date.change(day: due_day)
        else
          due_date.end_of_month
        end

      Bill.create!(value: value_each_bill, due_date: due_date, status: 'Open', enrollment_id: id) 

      index += 1
    end
  end
end










































# PENDENTE - FAZER COM QUE O DIA QUE O ALUNO ESCOLHER SEJA O DIA DE VENCIMENTO DA FATURA


  # def check_age(birthdate)
  #   birthdate = birthdate
  #   today = Date.today
  #   birth = Date.parse(birthdate)
  #   age = today.year - birth.year
  #   age -= 1 if today.month < birth.month || (today.month == birth.month && today.day < birth.day)
  #   age
  # end
  
  # age = check_age(birthdate)
  # end

























































# def legal_age_university
#     general_age_calculation('Você não possui idade minima para ingressar nesta Faculdade')
# end

# def legal_age_school
#     general_age_calculation('Você não possui idade minima para ingressar nesta Escola')
# end

# def legal_age_Kindergarten
#     general_age_calculation('Você não possui idade minima/máxima para ingressar nesta creche')
# end

# private

# def general_age_calculation(error_message)
#     dob = Date.strptime(date_of_birth, "%d/%m/%Y")
#     now = Time.zone.now.to_date
#     age = now.year - dob.year
      
#     if now.month < dob.month || (now.month == dob.month && now.day < dob.day)
#         age -= 1
#     end
# end

