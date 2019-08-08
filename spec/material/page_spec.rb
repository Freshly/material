# frozen_string_literal: true

RSpec.describe Material::Page, type: :concern do
  include_context "with an example material"

  it { is_expected.to have_material_component :parent }
  it { is_expected.to have_material_component :filter }
  it { is_expected.to have_material_component :filter_default }
end
