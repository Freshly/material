# frozen_string_literal: true

RSpec.describe Material::List, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Collectible::CollectionBase }

  it { is_expected.to include_module Material::Components }
  it { is_expected.to include_module Material::Icon }
  it { is_expected.to include_module Material::Text }
  it { is_expected.to include_module Material::Site }
  it { is_expected.to include_module Material::For }
  it { is_expected.to include_module Material::Pagination }

  describe ".for" do
    include_context "with an example list"

    it_behaves_like "a material lookup", :list do
      let(:base_class) { described_class }
      let(:example_class) { example_list_class }
    end
  end
end
