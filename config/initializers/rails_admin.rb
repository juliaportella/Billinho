def format_date_field(field_name, format)
  field field_name do
    strftime_format format
  end
end

def format_currency_field(field_name)
  field field_name do
    formatted_value do
      "R$ #{value.to_s.gsub('.', ',')}"
    end
  end
end

def configure_enum_field(field_name, values)
  field field_name, :enum do
    enum do
      values
    end
  end
end

def configure_integer_field(field_name, min, max)
  field field_name, :integer do
    html_attributes do
      { min: min, max: max }
    end
  end
end

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
      format_date_field :created_at, "%d/%m/%Y"
      format_currency_field :value
      field :enrollment do
        pretty_value do
          bindings[:object].word_enrollment_translation
        end
      end
    end

    edit do
      include_all_fields
      format_date_field :due_date, "%d/%m/%Y"
      configure_enum_field :status, [['Open'], ['Overdue'], ['Paid']]
      configure_integer_field :value, 1, 10000
    end
  end

  config.model 'Enrollment' do
    list do
      exclude_fields :updated_at, :bills
      format_date_field :created_at, "%d/%m/%Y"
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
      format_currency_field :course_value
    end

    edit do
      include_all_fields
      exclude_fields :bills
      configure_enum_field :status, [['Active'], ['Canceled'], ['Locked']]
      configure_integer_field :course_value, 1, 100000
      configure_integer_field :quantity_bills, 1, 100
      configure_integer_field :due_day, 1, 31
    end
  end

  config.model 'Institution' do
    list do
      exclude_fields :updated_at
      format_date_field :created_at, "%d/%m/%Y"
      field :enrollments do
        pretty_value do
          bindings[:object].enrollments.count
        end
      end
    end

    edit do
      exclude_fields :enrollments
      configure_enum_field :modality, [['University'], ['School'], ['Kindergarten']]
      configure_enum_field :status, [['Active'], ['Inactive']]
    end
  end

  config.model 'Student' do
    list do
      include_all_fields
      exclude_fields :updated_at, :status
      field :enrollments do
        pretty_value do
          bindings[:object].enrollments.count
        end
      end
      format_date_field :birthdate, "%d/%m/%Y"
      format_date_field :created_at, "%d/%m/%Y"
    end

    edit do
      exclude_fields :enrollments, :status
      configure_enum_field :payment_method, [['Boleto'], ['Cartão']]
    end
  end
end
