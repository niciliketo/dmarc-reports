# frozen_string_literal: true

require 'application_system_test_case'

class PolicyPublishedsTest < ApplicationSystemTestCase
  setup do
    @policy_published = policy_publisheds(:one)
  end

  test 'visiting the index' do
    visit policy_publisheds_url
    assert_selector 'h1', text: 'Policy publisheds'
  end

  test 'should create policy published' do
    visit policy_publisheds_url
    click_on 'New policy published'

    fill_in 'Adkim', with: @policy_published.adkim
    fill_in 'Aspf', with: @policy_published.aspf
    fill_in 'Domain', with: @policy_published.domain
    fill_in 'P', with: @policy_published.p
    fill_in 'Pct', with: @policy_published.pct
    click_on 'Create Policy published'

    assert_text 'Policy published was successfully created'
    click_on 'Back'
  end

  test 'should update Policy published' do
    visit policy_published_url(@policy_published)
    click_on 'Edit this policy published', match: :first

    fill_in 'Adkim', with: @policy_published.adkim
    fill_in 'Aspf', with: @policy_published.aspf
    fill_in 'Domain', with: @policy_published.domain
    fill_in 'P', with: @policy_published.p
    fill_in 'Pct', with: @policy_published.pct
    click_on 'Update Policy published'

    assert_text 'Policy published was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Policy published' do
    visit policy_published_url(@policy_published)
    click_on 'Destroy this policy published', match: :first

    assert_text 'Policy published was successfully destroyed'
  end
end
