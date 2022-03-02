require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_url
    assert_response :success
  end

  test "should create record" do
    assert_difference("Record.count") do
      post records_url, params: { record: { comment: @record.comment, dkim: @record.dkim, dkim_domain: @record.dkim_domain, dkim_hresult: @record.dkim_hresult, dkim_result: @record.dkim_result, header_from: @record.header_from, report_id: @record.report_id, source_ip: @record.source_ip, spf: @record.spf, spf_domain: @record.spf_domain, spf_result: @record.spf_result, type: @record.type } }
    end

    assert_redirected_to record_url(Record.last)
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  test "should update record" do
    patch record_url(@record), params: { record: { comment: @record.comment, dkim: @record.dkim, dkim_domain: @record.dkim_domain, dkim_hresult: @record.dkim_hresult, dkim_result: @record.dkim_result, header_from: @record.header_from, report_id: @record.report_id, source_ip: @record.source_ip, spf: @record.spf, spf_domain: @record.spf_domain, spf_result: @record.spf_result, type: @record.type } }
    assert_redirected_to record_url(@record)
  end

  test "should destroy record" do
    assert_difference("Record.count", -1) do
      delete record_url(@record)
    end

    assert_redirected_to records_url
  end
end
