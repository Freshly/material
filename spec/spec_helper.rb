# frozen_string_literal: true

require "bundler/setup"
require "pry"
require "simplecov"

require "timecop"

require "spicerack/spec_helper"
require "shoulda-matchers"

require_relative "../lib/material/spec_helper"

SimpleCov.start do
  add_filter "/spec/"
  add_filter "/rspec/"
end

require "material"

require_relative "support/shared_context/with_an_example_list"
require_relative "support/shared_context/with_an_example_material"

require_relative "support/shared_examples/a_material_lookup"

require_relative "support/test_classes/test_material"
require_relative "support/test_classes/foo_material"
require_relative "support/test_classes/user_material"
require_relative "support/test_classes/bar_material"
require_relative "support/test_classes/baz_gaz_material"

require_relative "support/test_classes/test_list"
require_relative "support/test_classes/foo_list"
require_relative "support/test_classes/user_list"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each, type: :with_frozen_time) { Timecop.freeze(Time.now.round) }
  config.before(:each, type: :integration) { Timecop.freeze(Time.now.round) }

  config.after(:each) { Timecop.return }
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end
