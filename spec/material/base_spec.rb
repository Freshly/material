# frozen_string_literal: true

RSpec.describe Material::Base, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Spicerack::AttributeObject }

  it { is_expected.to extend_module ActiveSupport::NumberHelper }

  it { is_expected.to include_module Material::Components }
  it { is_expected.to include_module Material::Core }
  it { is_expected.to include_module Material::Display }
  it { is_expected.to include_module Material::Text }
  it { is_expected.to include_module Material::Site }
  it { is_expected.to include_module Material::Format }
  it { is_expected.to include_module Material::Attributes }

  it { is_expected.to have_material_component :list_item_style }

  describe ".for" do
    include_context "with an example material"

    it_behaves_like "a material lookup" do
      let(:base_class) { described_class }
      let(:example_class) { example_material_class }
    end
  end

  describe "#to_source_model" do
    include_context "with an example material"

    subject { example_material.to_source_model }

    let(:source_model) { double }

    before { allow(source).to receive(:to_model).and_return(source_model) }

    it { is_expected.to eq source_model }
  end

  describe "#to_model" do
    include_context "with an example material"

    subject { example_material.to_model }

    it { is_expected.to eq example_material }
  end
end
