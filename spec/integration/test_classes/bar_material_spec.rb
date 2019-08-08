# frozen_string_literal: true

RSpec.describe BarMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from TestMaterial }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :bar }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to eq "icons.bar" }
  end

  describe "#title" do
    subject { material.title }

    it { is_expected.to eq "Bar" }
  end

  describe "#parameterized_title" do
    subject { material.parameterized_title }

    it { is_expected.to eq "bar" }
  end

  describe "#list_title" do
    subject { material.list_title }

    it { is_expected.to eq "Bar" }
  end

  describe "#header_title" do
    subject { material.header_title }

    it { is_expected.to eq "Bar" }
  end

  describe "#reference_title" do
    subject { material.reference_title }

    it { is_expected.to eq "Bar" }
  end

  describe "#breadcrumb_title" do
    subject { material.breadcrumb_title }

    it { is_expected.to eq "Bar" }
  end
end
