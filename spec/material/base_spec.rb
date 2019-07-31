# frozen_string_literal: true

RSpec.describe Material::Base, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Spicerack::AttributeObject }

  it { is_expected.to include_module Material::Core }
  it { is_expected.to include_module Material::Components }
end
