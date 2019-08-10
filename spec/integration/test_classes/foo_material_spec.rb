# frozen_string_literal: true

RSpec.describe FooMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from TestMaterial }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :question }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to be_nil }
  end

  describe "#title" do
    subject { material.title }

    it { is_expected.to eq "Foo" }
  end

  describe "#parameterized_title" do
    subject { material.parameterized_title }

    it { is_expected.to eq "foo" }
  end

  describe "#list_title" do
    subject { material.list_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#index_title" do
    subject { material.index_title }

    it { is_expected.to eq "Foos" }
  end

  describe "#header_title" do
    subject { material.header_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#reference_title" do
    subject { material.reference_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#breadcrumb_title" do
    subject { material.breadcrumb_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#breadcrumb_index_title" do
    subject { material.breadcrumb_index_title }

    it { is_expected.to eq "Foos" }
  end
end
