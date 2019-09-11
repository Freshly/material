# Changelog

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
