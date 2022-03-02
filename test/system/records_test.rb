require "application_system_test_case"

class RecordsTest < ApplicationSystemTestCase
  setup do
    @record = records(:one)
  end

  test "visiting the index" do
    visit records_url
    assert_selector "h1", text: "Records"
  end

  test "should create record" do
    visit records_url
    click_on "New record"

    fill_in "Comment", with: @record.comment
    fill_in "Dkim", with: @record.dkim
    fill_in "Dkim domain", with: @record.dkim_domain
    fill_in "Dkim hresult", with: @record.dkim_hresult
    fill_in "Dkim result", with: @record.dkim_result
    fill_in "Header from", with: @record.header_from
    fill_in "Report", with: @record.report_id
    fill_in "Source ip", with: @record.source_ip
    fill_in "Spf", with: @record.spf
    fill_in "Spf domain", with: @record.spf_domain
    fill_in "Spf result", with: @record.spf_result
    fill_in "Type", with: @record.type
    click_on "Create Record"

    assert_text "Record was successfully created"
    click_on "Back"
  end

  test "should update Record" do
    visit record_url(@record)
    click_on "Edit this record", match: :first

    fill_in "Comment", with: @record.comment
    fill_in "Dkim", with: @record.dkim
    fill_in "Dkim domain", with: @record.dkim_domain
    fill_in "Dkim hresult", with: @record.dkim_hresult
    fill_in "Dkim result", with: @record.dkim_result
    fill_in "Header from", with: @record.header_from
    fill_in "Report", with: @record.report_id
    fill_in "Source ip", with: @record.source_ip
    fill_in "Spf", with: @record.spf
    fill_in "Spf domain", with: @record.spf_domain
    fill_in "Spf result", with: @record.spf_result
    fill_in "Type", with: @record.type
    click_on "Update Record"

    assert_text "Record was successfully updated"
    click_on "Back"
  end

  test "should destroy Record" do
    visit record_url(@record)
    click_on "Destroy this record", match: :first

    assert_text "Record was successfully destroyed"
  end
end
