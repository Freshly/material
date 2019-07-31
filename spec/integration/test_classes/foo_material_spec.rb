# frozen_string_literal: true

RSpec.describe FooMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from TestMaterial }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :question }
  end

  describe "#icon_i18n" do
    subject { material.icon_i18n }

    it { is_expected.to be_nil }
  end
end
