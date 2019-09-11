# frozen_string_literal: true

RSpec.describe Material::Display, type: :concern do
  include_context "with an example material"

  it { is_expected.to have_material_component :icon }
  it { is_expected.to have_material_component :icon_title }

  it { is_expected.to have_material_component :badge }
  it { is_expected.to have_material_component :badge_style }

  it { is_expected.to have_material_component :label }
  it { is_expected.to have_material_component :label_style }
end
