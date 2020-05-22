# frozen_string_literal: true

RSpec.describe Material::Filter, type: :concern do
  include_context "with an example list"

  it { is_expected.to have_material_component :filter_field }
  it { is_expected.to have_material_component :filter_values }

  describe "#filter_values" do
    subject { example_list.filter_values }

    context "without filter_field" do
      it { is_expected.to eq [] }
    end

    context "with filter_field" do
      let(:filter_field) { Faker::Internet.domain_word }

      before { allow(example_list).to receive(:filter_field).and_return(filter_field) }

      context "with #filter_fields_i18n" do
        let(:filter_values) { double }

        before { allow(example_list).to receive("#{filter_field.to_s.pluralize}_i18n").and_return(filter_values) }

        it { is_expected.to eq filter_values }
      end

      context "without #filter_fields_i18n" do
        it { is_expected.to eq [] }
      end
    end
  end
end
