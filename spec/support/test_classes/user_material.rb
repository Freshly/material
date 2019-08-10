# frozen_string_literal: true

class UserMaterial < TestMaterial
  define_icon { :user }
  define_icon_title { "icons.user" }

  define_title { "user title" }
  define_list_title { "user list title" }
  define_header_title { "user header title" }
  define_reference_title { "user reference title" }
  define_breadcrumb_title { "user breadcrumb title" }

  define_index_title { "user index title" }
  define_breadcrumb_index_title { "user breadcrumb index title" }
end
