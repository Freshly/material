# frozen_string_literal: true

require "active_support"
require "active_support/core_ext"
require "active_support/number_helper"

require "spicerack"

require_relative "material/concerns/components"
require_relative "material/concerns/core"
require_relative "material/concerns/display"
require_relative "material/concerns/text"
require_relative "material/concerns/site"
require_relative "material/concerns/for"
require_relative "material/concerns/pagination"
require_relative "material/concerns/mount"
require_relative "material/concerns/collection"
require_relative "material/concerns/format"

require "material/version"

require "material/base"
require "material/list"

module Material; end
