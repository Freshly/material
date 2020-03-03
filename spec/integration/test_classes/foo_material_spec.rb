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

  describe ".delegate_missing_to" do
    subject { described_class.some_method }

    before { stub_const(described_class.prototype_name, example_class) }

    let(:example_class) do
      Class.new do
        def self.some_method
          :source_value
        end
      end
    end

    context "with a defined method" do
      before { allow(described_class).to receive(:some_method).and_return(:some_value) }

      it { is_expected.to eq :some_value }
    end

    context "without a defined method" do
      it { is_expected.to eq :source_value }
    end
  end
end
