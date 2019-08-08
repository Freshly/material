# frozen_string_literal: true

class UserList < TestList
  ensures_item_class UserMaterial

  define_icon { item_class.name.chomp("Material").downcase.to_sym }
  define_icon_title { "icons.#{item_class.name.chomp("Material").downcase}" }
end
