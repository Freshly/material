# frozen_string_literal: true

RSpec.describe Material::Icon, type: :concern do
  include_context "with an example material"

  it { is_expected.to have_material_component :icon }
  it { is_expected.to have_material_component :icon_title }
end
