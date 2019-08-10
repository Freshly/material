# frozen_string_literal: true

RSpec.describe FooList, type: :list do
  subject(:list) { described_class.new(item) }

  let(:item) { double }

  it { is_expected.to inherit_from TestList }

  describe "#count" do
    subject { list.count }

    it { is_expected.to eq 1 }
  end

  describe "#first" do
    subject { list.first }

    it { is_expected.to eq item }
  end

  describe "#icon" do
    subject { list.icon }

    it { is_expected.to eq :questions }
  end

  describe "#icon_title" do
    subject { list.icon_title }

    it { is_expected.to be_nil }
  end

  describe "#title" do
    subject { list.title }

    it { is_expected.to eq "Foo" }
  end

  describe "#parameterized_title" do
    subject { list.parameterized_title }

    it { is_expected.to eq "foo" }
  end

  describe "#list_title" do
    subject { list.list_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#index_title" do
    subject { list.index_title }

    it { is_expected.to eq "Foos" }
  end

  describe "#header_title" do
    subject { list.header_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#reference_title" do
    subject { list.reference_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#breadcrumb_title" do
    subject { list.breadcrumb_title }

    it { is_expected.to eq "Foo" }
  end

  describe "#breadcrumb_index_title" do
    subject { list.breadcrumb_index_title }

    it { is_expected.to eq "Foos" }
  end
end
