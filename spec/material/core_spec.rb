# frozen_string_literal: true

RSpec.describe Material::Core, type: :concern do
  include_context "with an example material"

  it { is_expected.to delegate_method(:name).to(:class).with_prefix(true) }
  it { is_expected.to delegate_method(:class).to(:source).with_prefix(true) }
  it { is_expected.to delegate_method(:to_param).to(:source) }
  it { is_expected.to delegate_method(:attribute_names).to(:source_class) }
  it { is_expected.to delegate_method(:human_attribute_name).to(:source_class) }
  it { is_expected.to delegate_method(:type_for_attribute).to(:source_class) }

  describe "#initialize" do
    context "without a source" do
      subject(:example_material) { example_material_class.new }

      it "raises" do
        expect { example_material }.to raise_error ArgumentError, "wrong number of arguments (given 0, expected 1)"
      end
    end

    context "without a nil source" do
      let(:source) { nil }

      it "raises" do
        expect { example_material }.to raise_error ArgumentError, "source is required"
      end
    end

    context "without a source" do
      it "assigns" do
        expect(example_material.source).to eq source
      end
    end
  end

  describe ".delegate_missing_to" do
    subject { example_material.some_method }

    before { allow(source).to receive(:some_method).and_return(:source_value) }

    context "with a defined method" do
      let(:example_material_class) do
        Class.new(Material::Base) do
          def some_method
            :some_value
          end
        end
      end

      it { is_expected.to eq :some_value }
    end

    context "without a defined method" do
      it { is_expected.to eq :source_value }
    end
  end

  describe ".references" do
    let(:field) { Faker::Internet.unique.domain_word.to_sym }
    let(:as) { Faker::Internet.unique.domain_word.to_sym }
    let(:source_value) { SecureRandom.hex }

    context "without from:" do
      subject(:references) { example_material_class.__send__(:references, field, as: as) }

      before { allow(source).to receive(field).and_return(source_value) }

      it "creates the reference" do
        references
        expect(example_material.public_send(as)).to eq source_value
      end
    end

    context "with from:" do
      subject(:references) { example_material_class.__send__(:references, field, as: as, from: from) }

      let(:from) { Faker::Internet.unique.domain_word.to_sym }
      let(:from_object) { double }
      let(:from_value) { SecureRandom.hex }

      before do
        allow(source).to receive(from).and_return(from_object)
        allow(from_object).to receive(field).and_return(from_value)
      end

      it "creates the reference" do
        references
        expect(example_material.public_send(as)).to eq from_value
      end
    end
  end
end
