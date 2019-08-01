# frozen_string_literal: true

RSpec.describe TestMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from Material::Base }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :question }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to be_nil }
  end
end
