# frozen_string_literal: true

RSpec.describe Material::Components, type: :module do
  include_context "with an example material"

  describe ".register_component" do
    let(:attribute) { Faker::Lorem.word.to_sym }

    describe "defines default" do
      let(:instance) { instance_double(described_class::Component) }
      let(:expected_components) { Hash[attribute, instance] }
      let(:options) { {} }

      shared_examples_for "a default is defined" do
        it "adds to _defaults" do
          expect { register_component }.
            to change { example_material_class._components }.
            from({}).
            to(expected_components)
        end
      end

      context "when no block is given" do
        before { allow(described_class::Component).to receive(:new).with(**options).and_return(instance) }

        context "without options" do
          subject(:register_component) { example_material_class.__send__(:register_component, attribute) }

          it_behaves_like "a default is defined"
        end

        context "with options" do
          subject(:register_component) { example_material_class.__send__(:register_component, attribute, **options) }

          context "when empty" do
            it_behaves_like "a default is defined"
          end

          context "when present" do
            let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }

            it_behaves_like "a default is defined"
          end
        end
      end

      context "when a block is given" do
        let(:block) do
          ->(_) { :block }
        end

        before { allow(described_class::Component).to receive(:new).with(**options, &block).and_return(instance) }

        context "without options" do
          subject(:register_component) { example_material_class.__send__(:register_component, attribute, &block) }

          it_behaves_like "a default is defined"
        end

        context "with options" do
          subject(:register_component) do
            example_material_class.__send__(:register_component, attribute, **options, &block)
          end

          context "when empty" do
            it_behaves_like "a default is defined"
          end

          context "when present" do
            let(:options) { Hash[*Faker::Lorem.words(4)].symbolize_keys }

            it_behaves_like "a default is defined"
          end
        end
      end
    end
  end

  describe ".inherited" do
    it_behaves_like "an inherited property", :register_component, :_components do
      let(:root_class) { example_material_class }
      let(:expected_attribute_value) do
        expected_property_value.each_with_object({}) do |option, hash|
          hash[option] = instance_of(described_class::Component)
        end
      end
    end
  end
end
