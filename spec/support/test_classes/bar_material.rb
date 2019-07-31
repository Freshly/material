# frozen_string_literal: true

class BarMaterial < TestMaterial
  define_icon { self.class.name.chomp("Material").underscore.to_sym }
  define_icon_i18n { "icons.#{icon}" }
end
