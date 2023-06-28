# frozen_string_literal: true

json.extract! student, :id, :name, :cpf, :birthdate, :phone, :gender, :payment_method, :created_at, :updated_at
json.url student_url(student, format: :json)
