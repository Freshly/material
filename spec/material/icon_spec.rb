# frozen_string_literal: true

RSpec.describe Material::Icon, type: :concern do
  include_context "with an example material"

  it { is_expected.to have_material_component :icon }
  it { is_expected.to have_material_component :icon_i18n }

  describe "#icon" do
    subject { example_material.icon }

    context "with nothing defined" do
      it { is_expected.to be_nil }
    end
  end

  describe "#icon_i18n" do
    subject { example_material.icon_i18n }

    context "with nothing defined" do
      it { is_expected.to be_nil }
    end
  end
end
