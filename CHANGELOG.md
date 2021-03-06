# Changelog

## 0.3.9

*Release Date*: 5/21/

- Delegate missing on List to item_class for both instance and class (was just class before)

## 0.3.8

*Release Date*: 5/21/2020

- Cleaned up Filter 
  - was in Material and List, now only in List
  - removed "filter_default" as that is Facet's responsibility now
  - renamed to filter_field
  - added filter_values to explicitly state filter options

## 0.3.7

*Release Date*: 4/28/2020

- Changed default truncate length and allow for changing via class method

## 0.3.6

*Release Date*: 4/10/2020

- Added generators to create stubs for materials and lists

## 0.3.5

*Release Date*: 3/3/2020

- Delegates missing methods on the class to the prototype/item_class

## 0.3.4

*Release Date*: 2/12/2020

- Display attributes

## 0.3.3

*Release Date*: 2/11/2020

- Enhancements to default text mapping

## 0.3.2

*Release Date*: 2/7/2020

- Fixed bug with list for plain ActiveRecord objects with no records

## 0.3.1

*Release Date*: 2/7/2020

- Gem Updates

## 0.3.0

*Release Date*: 1/13/2020

- Gem Updates

## 0.2.22

*Release Date*: 1/09/2020

- Use `Conjunction` gem

## 0.2.21

*Release Date*: 10/11/2019

- Materialize the value of parent
- Make `.dup` behavior in components smarter

## 0.2.20

*Release Date*: 10/10/2019

- Allow `Material::List` to be contextualized with a parent
- Prevent `.dup` on classes

## 0.2.19

*Release Date*: 09/13/2019

- Exposed the route keys used internally by `Material::Site`

## 0.2.18

*Release Date*: 09/12/2019

- Added `title` as a default to `default_title` in `Material::Text`

## 0.2.17

*Release Date*: 09/12/2019

- Delegate `model_name` properly for `Material::List`

## 0.2.16

*Release Date*: 09/11/2019

- Type bugfix

## 0.2.15

*Release Date*: 09/11/2019

- Explicitly delegate `#to_param`

## 0.2.14

*Release Date*: 09/11/2019

- Add `Material::Attributes` for decomposing data cleanly
- Cleaned up and extended `Material::Format` with numbers and generic entry

## 0.2.13

*Release Date*: 09/11/2019

- Add `Material::Format` for consistent formatting (starting with date/time)
- Refactor `Material::Icon` into `Material::Display`, adding badge and label

## 0.2.12

*Release Date*: 09/10/2019

- Paper over `Material::Base#to_model` so it works better with view rendering
- Override `Material::List#to_ary` to emit a material-wrapped collection

## 0.2.11

*Release Date*: 09/09/2019

- Improved `Material::List`
  - Auto-lookup
  - Always enforce type equality

## 0.2.10

*Release Date*: 09/09/2019

- Added `List::Mount` for `Facet` support

## 0.2.9

*Release Date*: 09/09/2019

- Added `List::Pagination`

## 0.2.8

*Release Date*: 08/30/2019

- Use case fix for `List::For`

## 0.2.7

*Release Date*: 08/30/2019

- Bugfix for `Material::For` and `List::For`

## 0.2.6

*Release Date*: 08/10/2019

- Added `index` titles to `Material::Text`

## 0.2.5

*Release Date*: 08/10/2019

- `Material::Page` to `Material::Site` refactor

## 0.2.4

*Release Date*: 08/09/2019

- `Material::For` bugfix

## 0.2.3

*Release Date*: 08/09/2019

- `Material::For`
- Actually exposed any code 😅

## 0.2.2

*Release Date*: 08/09/2019

- `Material::Page` concern

## 0.2.1

*Release Date*: 08/08/2019

- `Material::List` with text and icons

## 0.2.0

*Release Date*: 02/08/2019

- `Material::Base` with text and icons

## 0.1.0

*Release Date*: 07/01/2019

- Initial commit (blank project)
