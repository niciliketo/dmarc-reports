# frozen_string_literal: true

require 'test_helper'

class PolicyPublishedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @policy_published = policy_publisheds(:one)
  end

  test 'should get index' do
    get policy_publisheds_url
    assert_response :success
  end

  test 'should get new' do
    get new_policy_published_url
    assert_response :success
  end

  test 'should create policy_published' do
    assert_difference('PolicyPublished.count') do
      post policy_publisheds_url,
           params: { policy_published: { adkim: @policy_published.adkim, aspf: @policy_published.aspf,
                                         domain: @policy_published.domain, p: @policy_published.p, pct: @policy_published.pct } }
    end

    assert_redirected_to policy_published_url(PolicyPublished.last)
  end

  test 'should show policy_published' do
    get policy_published_url(@policy_published)
    assert_response :success
  end

  test 'should get edit' do
    get edit_policy_published_url(@policy_published)
    assert_response :success
  end

  test 'should update policy_published' do
    patch policy_published_url(@policy_published),
          params: { policy_published: { adkim: @policy_published.adkim, aspf: @policy_published.aspf,
                                        domain: @policy_published.domain, p: @policy_published.p, pct: @policy_published.pct } }
    assert_redirected_to policy_published_url(@policy_published)
  end

  test 'should destroy policy_published' do
    assert_difference('PolicyPublished.count', -1) do
      delete policy_published_url(@policy_published)
    end

    assert_redirected_to policy_publisheds_url
  end
end
