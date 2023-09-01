RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.actions do
    dashboard
    index
    new
    export
    show
    edit
    delete do
      only ['Bill']
    end
  end

  config.model 'Bill' do
    list do
      exclude_fields :updated_at
      format_created_at_field
      format_due_date
      field :value do
        formatted_value do
          "R$ #{value.to_s.gsub('.', ',')}"
        end
      end
      field :enrollment do
        pretty_value do
          bindings[:object].word_enrollment_translation
        end
      end
    end
    edit do
      include_all_fields
      format_due_date
      field :status, :enum do
        enum do
          [['Open'], ['Overdue'], ['Paid']]
        end
      end
      field :value, :integer do
        html_attributes do
          { min: 1, max: 10000 }
        end
      end
    end
  end

  config.model 'Enrollment' do
    list do
      exclude_fields :updated_at, :bills
      format_created_at_field
      field :student do
        pretty_value do
          bindings[:object].student.name
        end
      end
      field :institution do
        pretty_value do
          bindings[:object].institution.name
        end
      end
      field :course_value do
        formatted_value do
          "R$ #{value.to_s.gsub('.', ',')}"
        end
      end
    end

    edit do
      include_all_fields
      exclude_fields :bills
      field :status, :enum do
        enum do
          [['Active'], ['Canceled'], ['Locked']]
        end
      end
      field :course_value, :integer do
        html_attributes do
          { min: 1, max: 100000 }
        end
      end
      field :quantity_bills, :integer do
        html_attributes do
          { min: 1, max: 100 }
        end
      end
      field :due_day, :integer do
        html_attributes do
          { min: 1, max: 31 }
        end
      end
    end
  end

  config.model 'Institution' do
    list do
      exclude_fields :updated_at
      format_created_at_field
      count_enrollments
    end

    edit do
      exclude_fields :enrollments
      field :modality, :enum do
        enum do
          [['University'], ['School'], ['Kindergarten']]
        end
      end
      field :status, :enum do
        enum do
          [['Active'], ['Inactive']]
        end
      end
    end
  end

  config.model 'Student' do
    list do
      include_all_fields
      exclude_fields :updated_at, :status
      count_enrollments
      format_birthdate_field
      format_created_at_field
    end

    edit do
      exclude_fields :enrollments, :status
      field :payment_method, :enum do
        enum do
          [['Boleto'], ['Cartão']]
        end
    end
  end
end

def format_created_at_field
  field :created_at do
    strftime_format "%d/%m/%Y"
  end
end

def format_birthdate_field
  field :birthdate do
    strftime_format "%d/%m/%Y"
  end
end

def format_due_date
  field :due_date do
    strftime_format "%d/%m/%Y"
  end
end

def count_enrollments
  field :enrollments do
    pretty_value do
      bindings[:object].enrollments.count
    end
  end
end
end