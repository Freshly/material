# frozen_string_literal: true

RSpec.describe BazGazMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from BarMaterial }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :baz_gaz }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to eq "icons.baz_gaz" }
  end

  describe "#title" do
    subject { material.title }

    it { is_expected.to eq "Baz Gaz" }
  end

  describe "#parameterized_title" do
    subject { material.parameterized_title }

    it { is_expected.to eq "baz-gaz" }
  end

  describe "#list_title" do
    subject { material.list_title }

    it { is_expected.to eq "Baz Gaz" }
  end

  describe "#index_title" do
    subject { material.index_title }

    it { is_expected.to eq "Baz Gazs" }
  end

  describe "#header_title" do
    subject { material.header_title }

    it { is_expected.to eq "Baz Gaz" }
  end

  describe "#reference_title" do
    subject { material.reference_title }

    it { is_expected.to eq "Baz Gaz" }
  end

  describe "#breadcrumb_title" do
    subject { material.breadcrumb_title }

    it { is_expected.to eq "Baz Gaz" }
  end

  describe "#breadcrumb_index_title" do
    subject { material.breadcrumb_index_title }

    it { is_expected.to eq "Baz Gazs" }
  end
end
