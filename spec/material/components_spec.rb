# frozen_string_literal: true

RSpec.describe Material::Components, type: :module do
  include_context "with an example material"

  describe ".register_component" do
    let(:component_name) { Faker::Lorem.word.to_sym }

    let(:instance) { instance_double(described_class::Component) }
    let(:expected_components) { Hash[component_name, instance] }
    let(:options) { {} }

    shared_examples_for "a component configurator is defined" do
      subject(:define_component) do
        example_material_class.__send__("define_#{component_name}".to_sym, **example_options, &example_block)
      end

      let(:result) { double }
      let(:example_options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }
      let(:example_block) do
        proc { :block_value }
      end

      before do
        register_component
        allow(instance).to receive(:configure)
      end

      it "calls configure" do
        define_component
        expect(instance).to have_received(:configure).with(**example_options, &example_block)
      end
    end

    shared_examples_for "a component is registered" do
      let(:value) { double }

      before { allow(instance).to receive(:value_for).with(example_material).and_return(value) }

      it "adds to _components" do
        expect { register_component }.
          to change { example_material_class._components }.
          to(hash_including(expected_components))
      end

      it "defines a reader" do
        register_component
        expect(example_material_class.public_send("#{component_name}_component".to_sym)).to eq instance
        expect(example_material.public_send("#{component_name}_component".to_sym)).to eq instance
      end

      it "defines a value reader" do
        register_component
        expect(example_material.public_send("#{component_name}_value".to_sym)).to eq value
        expect(example_material.public_send(component_name)).to eq value
      end

      shared_examples_for "defines a component predicate" do
        it "defines a value predicate" do
          register_component
          expect(example_material.public_send("#{component_name}_value?".to_sym)).to eq expected_value
          expect(example_material.public_send("#{component_name}?".to_sym)).to eq expected_value
        end
      end

      context "with a value" do
        it_behaves_like "defines a component predicate" do
          let(:expected_value) { true }
        end
      end

      context "with no value" do
        it_behaves_like "defines a component predicate" do
          let(:value) { nil }
          let(:expected_value) { false }
        end
      end

      it_behaves_like "a component configurator is defined"
    end

    context "when no block is given" do
      before { allow(described_class::Component).to receive(:new).with(**options).and_return(instance) }

      context "without options" do
        subject(:register_component) { example_material_class.__send__(:register_component, component_name) }

        it_behaves_like "a component is registered"
      end

      context "with options" do
        subject(:register_component) { example_material_class.__send__(:register_component, component_name, **options) }

        context "when empty" do
          it_behaves_like "a component is registered"
        end

        context "when present" do
          let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }

          it_behaves_like "a component is registered"
        end
      end
    end

    context "when a block is given" do
      let(:block) do
        ->(_) { :block }
      end

      before { allow(described_class::Component).to receive(:new).with(**options, &block).and_return(instance) }

      context "without options" do
        subject(:register_component) { example_material_class.__send__(:register_component, component_name, &block) }

        it_behaves_like "a component is registered"
      end

      context "with options" do
        subject(:register_component) do
          example_material_class.__send__(:register_component, component_name, **options, &block)
        end

        context "when empty" do
          it_behaves_like "a component is registered"
        end

        context "when present" do
          let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }

          it_behaves_like "a component is registered"
        end
      end
    end
  end

  describe ".inherited" do
    it_behaves_like "an inherited property", :register_component, :_components do
      let(:root_class) { Class.new(Spicerack::AttributeObject).tap { |klass| klass.include described_class } }
      let(:expected_attribute_value) do
        expected_property_value.each_with_object({}) do |option, hash|
          hash[option] = instance_of(described_class::Component)
        end
      end
    end
  end
end
