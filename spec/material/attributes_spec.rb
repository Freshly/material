# frozen_string_literal: true

RSpec.describe Material::Attributes, type: :concern do
  include_context "with an example material"

  it { is_expected.to delegate_method(:head_attributes).to(:class) }
  it { is_expected.to delegate_method(:tail_attributes).to(:class) }

  describe ".head_attributes" do
    subject { example_material_class.head_attributes }

    it { is_expected.to eq %w[id] }
  end

  describe ".tail_attributes" do
    subject { example_material_class.tail_attributes }

    it { is_expected.to eq %w[created_at updated_at] }
  end

  describe "#human_attribute_value" do
    subject(:human_attribute_value) { example_material.human_attribute_value(attribute) }

    let(:formatted_attributes) do
      { attribute_name => attribute_value }
    end

    let(:attribute_name) { Faker::Internet.domain_word }
    let(:attribute_value) { SecureRandom.hex }

    before { allow(example_material).to receive(:formatted_attributes).and_return(formatted_attributes) }

    context "when present" do
      let(:attribute) { attribute_name }

      it { is_expected.to eq attribute_value }
    end

    context "when absent" do
      let(:attribute) { SecureRandom.hex }

      it "raises" do
        expect { human_attribute_value }.to raise_error KeyError, "key not found: \"#{attribute}\""
      end
    end
  end

  describe "#attribute_values" do
    subject { example_material.attribute_values }

    let(:display_attributes) { [ attribute0, attribute1 ] }

    let(:attribute0) { Faker::Internet.domain_word }
    let(:value0) { SecureRandom.hex }
    let(:attribute1) { "#{attribute0}foo" }
    let(:value1) { SecureRandom.hex }

    let(:expected_hash) do
      { attribute0 => value0, attribute1 => value1 }
    end

    before do
      allow(example_material).to receive(:display_attributes).and_return(display_attributes)
      allow(example_material).to receive(attribute0.to_sym).and_return(value0)
      allow(example_material).to receive(attribute1.to_sym).and_return(value1)
    end

    it { is_expected.to eq expected_hash }
  end

  describe "#attribute_types" do
    subject { example_material.attribute_types }

    let(:display_attributes) { [ attribute0, attribute1 ] }

    let(:attribute0) { Faker::Internet.domain_word }
    let(:type0) { SecureRandom.hex }
    let(:model_type0) { double(type: type0) }
    let(:attribute1) { "#{attribute0}foo" }
    let(:type1) { SecureRandom.hex }
    let(:model_type1) { double(type: type1) }

    let(:expected_hash) do
      { attribute0 => type0, attribute1 => type1 }
    end

    before do
      allow(example_material).to receive(:display_attributes).and_return(display_attributes)
      allow(example_material).to receive(:type_for_attribute).with(attribute0).and_return(model_type0)
      allow(example_material).to receive(:type_for_attribute).with(attribute1).and_return(model_type1)
    end

    it { is_expected.to eq expected_hash }
  end

  describe "#formatted_attributes" do
    subject { example_material.formatted_attributes }

    let(:attribute_types) do
      { attribute0 => type0, attribute1 => type1 }
    end

    let(:attribute_values) do
      { attribute0 => value0, attribute1 => value1 }
    end

    let(:attribute0) { Faker::Internet.domain_word }
    let(:type0) { SecureRandom.hex }
    let(:value0) { SecureRandom.hex }
    let(:formatted0) { "pretty: #{value0}" }

    let(:attribute1) { "#{attribute0}foo" }
    let(:type1) { SecureRandom.hex }
    let(:value1) { SecureRandom.hex }
    let(:formatted1) { "pretty: #{value1}" }

    let(:expected_hash) do
      { attribute0 => formatted0, attribute1 => formatted1 }
    end

    before do
      allow(example_material).to receive(:attribute_types).and_return(attribute_types)
      allow(example_material).to receive(:attribute_values).and_return(attribute_values)
      allow(example_material).to receive(:format_by_type).with(value0, type: type0).and_return(formatted0)
      allow(example_material).to receive(:format_by_type).with(value1, type: type1).and_return(formatted1)
    end

    it { is_expected.to eq expected_hash }
  end

  describe "#display_attributes" do
    subject { example_material.display_attributes }

    let(:attribute_names) { %w[dog cat id updated_at apple created_at banana] }

    before { allow(example_material).to receive(:attribute_names).and_return(attribute_names) }

    it { is_expected.to eq attribute_names }
  end

  describe "#sorted_attribute_names" do
    subject { example_material.sorted_attribute_names }

    let(:display_attributes) { %w[dog cat id updated_at apple created_at banana] }

    before { allow(example_material).to receive(:display_attributes).and_return(display_attributes) }

    it { is_expected.to eq %w[id apple banana cat dog created_at updated_at] }
  end

  describe "#relationship_attributes" do
    subject { example_material.relationship_attributes }

    let(:source_class) { example_material.source_class }
    let(:foreign_key0) { Faker::Internet.domain_word }
    let(:foreign_key1) { "#{foreign_key0}foo" }
    let(:reflect_on_all_associations) do
      [ double(foreign_key: foreign_key0), double(foreign_key: foreign_key1) ]
    end

    before { allow(source_class).to receive(:reflect_on_all_associations).and_return(reflect_on_all_associations) }

    it { is_expected.to eq [ foreign_key0, foreign_key1 ] }
  end
end
