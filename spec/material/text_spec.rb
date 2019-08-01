# frozen_string_literal: true

RSpec.describe Material::Text, type: :concern do
  include_context "with an example material"

  let(:default_truncate_length) { described_class::DEFAULT_TRUNCATE_LENGTH }

  it { is_expected.to have_material_component(:title).with_options(max_length: Float::INFINITY) }
  it { is_expected.to have_material_component(:list_title).with_options(max_length: default_truncate_length) }
  it { is_expected.to have_material_component(:header_title).with_options(max_length: default_truncate_length) }

  shared_examples_for "truncated text" do |key|
    subject { example_material.public_send(key) }

    let(:value) { example_material.public_send("#{key}_value".to_sym) }

    before do
      example_material_class.public_send("define_#{key}".to_sym, max_length: max_length) { SecureRandom.hex }
    end

    shared_examples_for "the _truncated? predicate is" do |predicate_value|
      subject { example_material.public_send("#{key}_truncated?".to_sym) }

      it { is_expected.to eq predicate_value }
    end

    context "with title longer than max length" do
      let(:max_length) { rand(10..20) }

      it { is_expected.to eq value.truncate(max_length) }
      it { is_expected.to have_attributes(length: max_length) }
      it_behaves_like "the _truncated? predicate is", true
    end

    context "with title shorter than max length" do
      let(:max_length) { Float::INFINITY }

      it { is_expected.to eq value }
      it_behaves_like "the _truncated? predicate is", false
    end
  end

  shared_examples_for "a truncated title component" do |key|
    subject { example_material.public_send(key) }

    before do
      example_material_class.define_title { "title_value" }
    end

    it { is_expected.to eq "title_value" }

    it_behaves_like "truncated text", key
  end

  describe ".title" do
    it_behaves_like "truncated text", :title
  end

  describe ".list_title" do
    it_behaves_like "a truncated title component", :list_title
  end

  describe ".header_title" do
    it_behaves_like "a truncated title component", :header_title
  end

  describe ".reference_title" do
    it_behaves_like "a truncated title component", :reference_title
  end
end
