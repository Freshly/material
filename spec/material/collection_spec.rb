# frozen_string_literal: true

RSpec.describe Material::Collection, type: :concern do
  include_context "with an example list"

  it { is_expected.to delegate_method(:item_class).to(:class) }
  it { is_expected.to delegate_method(:model_name).to(:item_class) }

  # TODO: Improve this spec...
  describe ".item_class" do
    subject { example_list_class.item_class }

    it { is_expected.to be_nil }
  end

  # TODO: Improve this spec...
  describe ".ensure_item_validity_with" do
    subject { example_list_class.ensure_item_validity_with }

    let(:item_class) { double }

    before { allow(example_list_class).to receive(:item_class).and_return(item_class) }

    it { is_expected.to eq item_class }
  end

  describe "#to_ary" do
    subject { example_list.to_ary }

    let(:item0) { double }
    let(:item1) { double }
    let(:item2) { double }
    let(:source) { [ item0, item1, item2 ] }

    context "with no items" do
      let(:source) { [] }

      it { is_expected.to eq [] }
    end

    context "with material" do
      let(:material_class) { Class.new(Material::Base) }

      before { allow(item0).to receive(:material_class).and_return(material_class) }

      it { is_expected.to all be_an_instance_of(material_class) }
    end

    context "without material" do
      it { is_expected.to eq source }
    end
  end
end
