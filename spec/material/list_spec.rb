# frozen_string_literal: true

RSpec.describe Material::List, type: :material do
  subject { described_class }

  it { is_expected.to inherit_from Collectible::CollectionBase }

  it { is_expected.to include_module Conjunction::Junction }

  it { is_expected.to include_module Material::Components }
  it { is_expected.to include_module Material::Display }
  it { is_expected.to include_module Material::Text }
  it { is_expected.to include_module Material::Site }
  it { is_expected.to include_module Material::Pagination }
  it { is_expected.to include_module Material::Mount }
  it { is_expected.to include_module Material::Collection }
  it { is_expected.to include_module Material::Format }

  describe ".for" do
    include_context "with an example list"

    it_behaves_like "a material lookup" do
      let(:base_class) { described_class }
      let(:example_class) { example_list_class }

      context "when a class" do
        let(:reference) { object_class }
        let(:klass) { double }
        let(:example_instance) { double }

        before { allow(klass).to receive(:new).with(no_args).and_return(example_instance) }

        it { is_expected.to eq example_instance }
      end

      context "when responding to first but not an array" do
        let(:reference) do
          Class.new(object_class).define_singleton_method(:first) { nil }
        end
        let(:klass) { double }
        let(:example_instance) { double }

        before { allow(klass).to receive(:new).with(object).and_return(example_instance) }

        it { is_expected.to eq example_instance }
      end

      context "when an array" do
        let(:object) { [ reference ] }
        let(:klass) { double }
        let(:example_instance) { double }

        before { allow(klass).to receive(:new).with(object).and_return(example_instance) }

        it { is_expected.to eq example_instance }
      end
    end
  end

  describe ".for_class" do
    include_context "with an example list"

    it_behaves_like "a material class lookup" do
      let(:base_class) { described_class }
      let(:example_class) { example_list_class }
    end
  end

  describe "#default_parent" do
    include_context "with an example list"

    subject { example_list.default_parent }

    context "without a context_parent" do
      it { is_expected.to be_nil }
    end

    context "with a context_parent" do
      before { example_list.instance_variable_set(:@context_parent, context_parent) }

      let(:context_parent) { double }

      it { is_expected.to eq context_parent }
    end
  end

  describe "#contextualize" do
    include_context "with an example list"

    subject(:contextualize) { example_list.contextualize(context) }

    let(:context) { double }

    it "sets the ivar" do
      expect { contextualize }.to change { example_list.instance_variable_get(:@context_parent) }.from(nil).to(context)
    end
  end
end
