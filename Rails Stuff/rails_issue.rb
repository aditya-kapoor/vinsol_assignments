# Activate the gem you are reporting the issue against.
gem 'activerecord', '3.2.13'
require 'active_record'
require 'minitest/autorun'
require 'logger'
require 'ruby-debug'

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :test_name_with_no_on_option
    t.string :test_name_with_on_save_option
  end
end

class User < ActiveRecord::Base
  attr_accessible :test_name_with_no_on_option, :test_name_with_on_save_option
  validates :test_name_with_no_on_option, presence: true
  validates :test_name_with_on_save_option, presence: true, on: :save
end

class BugTest < MiniTest::Unit::TestCase
  
  def test_validation_for_test_name_with_no_on_option_on_create
    # Validations for test_name_with_no_on_option on create
    user = User.create
    
    refute_nil user.errors.messages
    assert_includes user.errors.messages, :test_name_with_no_on_option 
    assert_equal ["can't be blank"], user.errors.messages[:test_name_with_no_on_option]
  end

  def test_validation_for_test_name_with_no_on_option_on_update
    # Validations for test_name_with_no_on_option on update
    user = User.create(test_name_with_no_on_option: "Attribute_1", attribute_2: "Attribute 2")
    user.test_name_with_no_on_option = ""
    user.valid?

    refute_nil user.errors.messages
    assert_includes user.errors.messages, :test_name_with_no_on_option 
    assert_equal ["can't be blank"], user.errors.messages[:test_name_with_no_on_option]
  end

  def test_validation_for_test_name_with_on_save_option_on_create
    # Validations not running for test_name_with_on_save_option on create
    user = User.create
    
    refute_nil user.errors.messages
    assert_includes user.errors.messages, :test_name_with_on_save_option 
    assert_equal ["can't be blank"], user.errors.messages[:test_name_with_on_save_option]
  end

  def test_validation_for_test_name_with_on_save_option_on_update
    # Validations for test_name_with_on_save_option on update
    user = User.create(:test_name_with_no_on_option => "Attribute_1", :test_name_with_on_save_option => "Attribute 2")
    user.test_name_with_on_save_option = ""
    user.valid?

    refute_nil user.errors.messages
    assert_includes user.errors.messages, :test_name_with_on_save_option
    assert_equal ["can't be blank"], user.errors.messages[:test_name_with_on_save_option]
  end
end