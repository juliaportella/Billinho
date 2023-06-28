# frozen_string_literal: true

json.extract! bill, :id, :value, :due_date, :enrollment_id, :status, :created_at, :updated_at
json.url bill_url(bill, format: :json)
