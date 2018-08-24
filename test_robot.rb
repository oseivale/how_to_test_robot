require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
      val = Robot.new
      val.foreign_model = true
      val.needs_repairs = true
    # act
      result = val.station
    # assert
      assert_equal(1, result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    bob = Robot.new
    bob.vintage_model = true
    bob.needs_repairs = true
    # act
    result = bob.station
    # assert
    assert_equal(2, result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    bill = Robot.new
    bill.needs_repairs = true
    # act
    result = bill.station
    # assert
    assert_equal(3, result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    katie = Robot.new
    # act
    result = katie.station
    # assert
    assert_equal(4, result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot5 = Robot.new
    robot5.todos = []
    # act
    result = robot5.prioritize_tasks
    # assert
    assert_equal(-1, result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot6 = Robot.new
    robot6.todos = ["add oil", "charge first"]
    # act
    result = robot6.prioritize_tasks

    # assert
    assert result == "charge first"
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot7 = Robot.new
    robot7.day_off = "Sunday"
    # act
    result = robot7.workday?("Sunday")
    # assert
    assert_equal(false, result)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot8 = Robot.new
    robot8.day_off = "Saturday"
    # act
    result = robot8.workday?("Tuesday")

    # assert
    assert_equal(true, result)
  end

end
