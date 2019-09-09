# frozen_string_literal: true

class FooList < TestList
  ensures_item_class SomeOther

  define_title { "Foo" }
end
