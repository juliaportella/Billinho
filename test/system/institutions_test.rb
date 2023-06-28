# frozen_string_literal: true

require 'application_system_test_case'

class InstitutionsTest < ApplicationSystemTestCase
  setup do
    @institution = institutions(:one)
  end

  test 'visiting the index' do
    visit institutions_url
    assert_selector 'h1', text: 'Institutions'
  end

  test 'should create institution' do
    visit institutions_url
    click_on 'New institution'

    fill_in 'Cnpj', with: @institution.cnpj
    fill_in 'Modality', with: @institution.modality
    fill_in 'Name', with: @institution.name
    click_on 'Create Institution'

    assert_text 'Institution was successfully created'
    click_on 'Back'
  end

  test 'should update Institution' do
    visit institution_url(@institution)
    click_on 'Edit this institution', match: :first

    fill_in 'Cnpj', with: @institution.cnpj
    fill_in 'Modality', with: @institution.modality
    fill_in 'Name', with: @institution.name
    click_on 'Update Institution'

    assert_text 'Institution was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Institution' do
    visit institution_url(@institution)
    click_on 'Destroy this institution', match: :first

    assert_text 'Institution was successfully destroyed'
  end
end
