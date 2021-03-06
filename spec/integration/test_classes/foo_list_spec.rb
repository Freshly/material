# frozen_string_literal: true

RSpec.describe FooList, type: :list do
  subject(:list) { described_class.new(item) }

  let(:item) { described_class.item_class.new }

  it { is_expected.to inherit_from TestList }

  describe ".item_class" do
    subject { described_class.item_class }

    it { is_expected.to eq SomeOther }
  end

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

  describe ".delegate_missing_to" do
    subject { described_class.some_method }

    before { allow(described_class.item_class).to receive(:some_method).and_return(:source_value) }

    context "with a defined method" do
      before { allow(described_class).to receive(:some_method).and_return(:some_value) }

      it { is_expected.to eq :some_value }
    end

    context "without a defined method" do
      it { is_expected.to eq :source_value }
    end
  end
end
