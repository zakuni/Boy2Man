require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require 'Boy2Man'

MiniTest::Reporters.use! [MiniTest::Reporters::DefaultReporter.new, MiniTest::Reporters::GuardReporter.new]
