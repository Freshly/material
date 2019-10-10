# frozen_string_literal: true

RSpec.describe Material::Site, type: :concern do
  include_context "with an example material"

  it { is_expected.to have_material_component :parent }
  it { is_expected.to have_material_component :filter }
  it { is_expected.to have_material_component :filter_default }
  it { is_expected.to have_material_component :path }
  it { is_expected.to have_material_component :index_path }

  shared_context "with an example model" do
    let(:source) { Class.new.tap { |klass| klass.include ActiveModel::Model } }
    let(:name) { Faker::Internet.domain_word.capitalize }

    before { stub_const(name, source) }
  end

  shared_context "with rails" do
    let(:rails) { double(application: application) }
    let(:application) { double(routes: routes) }
    let(:routes) { double(url_helpers: url_helpers) }
    let(:url_helpers) { double }

    before { stub_const("Rails", rails) }
  end

  shared_examples_for "a rails path predicate" do
    include_context "with rails"
    include_context "with an example model"

    before { allow(url_helpers).to receive(:respond_to?).with(expected_path).and_return(path_has_route?) }

    context "when the path has a route" do
      let(:path_has_route?) { true }

      it { is_expected.to eq true }
    end

    context "when the path doesn't have a route" do
      let(:path_has_route?) { false }

      it { is_expected.to eq false }
    end
  end

  describe "#parent" do
    subject { example_material.parent }

    let(:default_parent) { SecureRandom.hex }

    before { allow(example_material).to receive(:default_parent).and_return(default_parent) }

    it { is_expected.to eq default_parent }
  end

  describe "#default_parent" do
    subject { example_material.default_parent }

    it { is_expected.to be_nil }
  end

  describe "#singular_route_key" do
    subject { example_material.singular_route_key }

    context "when not a model" do
      it { is_expected.to be_nil }
    end

    context "with a model" do
      include_context "with an example model"

      it { is_expected.to eq source.model_name.singular_route_key }
    end
  end

  describe "#path" do
    subject { example_material.path }

    context "when not a model" do
      it { is_expected.to be_nil }
    end

    context "with a model" do
      include_context "with an example model"

      it { is_expected.to eq "#{source.model_name.singular_route_key}_path".to_sym }
    end
  end

  describe "#path?" do
    subject { example_material.path? }

    context "without rails" do
      it { is_expected.to eq false }
    end

    context "with rails" do
      it_behaves_like "a rails path predicate" do
        let(:expected_path) { "#{source.model_name.singular_route_key}_path".to_sym }
      end
    end
  end

  describe "#route_key" do
    subject { example_material.route_key }

    context "when not a model" do
      it { is_expected.to be_nil }
    end

    context "with a model" do
      include_context "with an example model"

      it { is_expected.to eq source.model_name.route_key }
    end
  end

  describe "#index_path" do
    subject { example_material.index_path }

    context "when not a model" do
      it { is_expected.to be_nil }
    end

    context "with a model" do
      include_context "with an example model"

      it { is_expected.to eq "#{source.model_name.route_key}_path".to_sym }
    end
  end

  describe "#index_path?" do
    subject { example_material.index_path? }

    context "without rails" do
      it { is_expected.to eq false }
    end

    context "with rails" do
      it_behaves_like "a rails path predicate" do
        let(:expected_path) { "#{source.model_name.route_key}_path".to_sym }
      end
    end
  end
end
