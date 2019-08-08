# frozen_string_literal: true

RSpec.describe Material::List, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Collectible::CollectionBase }

  it { is_expected.to include_module Material::Components }
  it { is_expected.to include_module Material::Icon }
  it { is_expected.to include_module Material::Text }
end
