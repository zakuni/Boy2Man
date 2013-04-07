#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'test_helper'

class TestBoy2Man < MiniTest::Unit::TestCase
  include Boy2Man

  def setup
    @stand = Boy2Man.new
  end

  def test_select_hand
    100.times do
      assert_includes ["グー", "チョキ", "パー"], @stand.select_hand
    end
  end

  def test_history
    assert_respond_to @stand, :history
    assert_raises(NoMethodError) {
      @stand.history = ['something']
    }

    assert_equal([], @stand.history)
    @stand.match("グー")
    assert_equal(["グー"], @stand.history)
    @stand.match("チョキ")
    assert_equal(["グー", "チョキ"], @stand.history)
  end
end
