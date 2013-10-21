require 'test_helper'

class TestBoy2Man < MiniTest::Unit::TestCase
  include Boy2Man
  def setup
    @janken = Janken.new
    @じゃんけん = Janken.new
  end

  def test_select_hand
    100.times do
      assert_includes ["グー", "チョキ", "パー"], @janken.select_hand
    end
  end

  def test_history
    assert_respond_to @janken, :history
    assert_raises(NoMethodError) {
      @janken.history = ['something']
    }

    assert_equal([], @janken.history)
    @janken.pon("グー")
    assert_equal(["グー"], @janken.history)
    @janken.pon("チョキ")
    assert_equal(["グー", "チョキ"], @janken.history)

    @janken.history.push("something")
    assert_equal(["グー", "チョキ"], @janken.history)
  end

  def test_reset
    assert_respond_to @janken, :reset
    @janken.pon("チョキ")
    assert_equal(["チョキ"], @janken.history)
    @janken.reset
    assert_equal([], @janken.history)
  end

  def test_pon
    assert_respond_to @janken, :pon
  end

  def test_hoi
    assert_respond_to @janken, :hoi
  end

  def test_ぽん
    assert_respond_to @じゃんけん, :ぽん
  end


  def test_ほい
    assert_respond_to @じゃんけん, :ほい
  end

  def test_predict
    100.times do
      assert_includes ["グー", "チョキ", "パー"], @janken.send(:predict)
    end
  end

  def test_judge
    assert_nil @janken.send(:judge, "グー", "グー")
    assert_equal "グー", @janken.send(:judge, "グー", "チョキ")
    assert_equal "パー", @janken.send(:judge, "グー", "パー")

    assert_equal "グー", @janken.send(:judge, "チョキ", "グー")
    assert_nil @janken.send(:judge, "チョキ", "チョキ")
    assert_equal "チョキ", @janken.send(:judge, "チョキ", "パー")

    assert_equal "パー", @janken.send(:judge, "パー", "グー")
    assert_equal "チョキ", @janken.send(:judge, "パー", "チョキ")
    assert_nil @janken.send(:judge, "パー", "パー")
  end
end