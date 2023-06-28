# frozen_string_literal: true

json.extract! enrollment, :id, :institution_id, :student_id, :course, :quantity_bills, :due_day, :course_value,
              :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
