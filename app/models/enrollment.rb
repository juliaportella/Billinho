# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :bills

  validates :status, inclusion: { in: %w[Active Canceled Locked] }


  after_create :create_bills

  def create_bills
    CreateBills.new(self).perform
  end
end

