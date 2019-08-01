# frozen_string_literal: true

class BarMaterial < TestMaterial
  define_icon { self.class.name.chomp("Material").underscore.to_sym }
  define_icon_title { "icons.#{icon}" }
  define_title { self.class.name.chomp("Material").underscore.humanize.titleize }
end
