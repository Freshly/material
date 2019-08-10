# frozen_string_literal: true

RSpec.describe Material::Base, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Spicerack::AttributeObject }

  it { is_expected.to include_module Material::Components }
  it { is_expected.to include_module Material::Core }
  it { is_expected.to include_module Material::Icon }
  it { is_expected.to include_module Material::Text }
  it { is_expected.to include_module Material::Site }
  it { is_expected.to include_module Material::For }

  describe ".for" do
    include_context "with an example material"

    it_behaves_like "a material lookup" do
      let(:base_class) { described_class }
      let(:example_class) { example_material_class }
    end
  end
end
