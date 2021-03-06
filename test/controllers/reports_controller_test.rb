# frozen_string_literal: true

require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test 'should get index' do
    get reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_report_url
    assert_response :success
  end

  test 'should create report' do
    assert_difference('Report.count') do
      post reports_url,
           params: { report: { begin: @report.begin, email: @report.email, end: @report.end,
                               extra_contact_info: @report.extra_contact_info, org_name: @report.org_name, report_id: @report.report_id, policy_published_id: @report.policy_published_id } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test 'should show report' do
    get report_url(@report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_report_url(@report)
    assert_response :success
  end

  test 'should update report' do
    patch report_url(@report),
          params: { report: { begin: @report.begin, email: @report.email, end: @report.end,
                              extra_contact_info: @report.extra_contact_info, org_name: @report.org_name, report_id: @report.report_id } }
    assert_redirected_to report_url(@report)
  end

  test 'should destroy report' do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
