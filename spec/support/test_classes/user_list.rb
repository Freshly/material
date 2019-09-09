# frozen_string_literal: true

class UserList < TestList
  define_icon { item_class.name.downcase.to_sym }
  define_icon_title { "icons.#{item_class.name.downcase}" }
end
