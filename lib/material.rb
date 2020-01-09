# frozen_string_literal: true

require "active_support"
require "active_support/core_ext"
require "active_support/number_helper"

require "spicery"

require_relative "material/concerns/components"
require_relative "material/concerns/core"
require_relative "material/concerns/display"
require_relative "material/concerns/text"
require_relative "material/concerns/site"
require_relative "material/concerns/pagination"
require_relative "material/concerns/mount"
require_relative "material/concerns/collection"
require_relative "material/concerns/format"
require_relative "material/concerns/attributes"

require "material/version"

require "material/base"
require "material/list"

module Material; end
