# frozen_string_literal: true

RSpec.describe Material::Format, type: :concern do
  include_context "with an example material"

  it { is_expected.to delegate_method(:format_date).to(:class) }
  it { is_expected.to delegate_method(:format_time).to(:class) }

  describe ".format_date" do
    subject { example_material_class.format_date(date) }

    let(:date) { Date.current }

    it { is_expected.to eq date.to_s(:long) }
  end

  describe "#format_time" do
    subject { example_material_class.format_time(time) }

    let(:time) { Time.current }

    it { is_expected.to eq time.to_s(:long) }
  end

  describe "#format_number" do
    subject { example_material_class.format_number(number) }

    let(:number) { 123456.789 }

    it { is_expected.to eq "123,456.789" }
  end

  describe "#format" do
    subject { example_material_class.format(value, type: type) }

    context "when :date" do
      let(:type) { :date }
      let(:value) { Date.today }

      it { is_expected.to eq example_material_class.format_date(value) }
    end

    context "when :datetime" do
      let(:type) { :datetime }
      let(:value) { DateTime.current }

      it { is_expected.to eq example_material_class.format_time(value) }
    end

    context "when :timestamp" do
      let(:type) { :timestamp }
      let(:value) { Time.current }

      it { is_expected.to eq example_material_class.format_time(value) }
    end

    context "when :time" do
      let(:type) { :time }
      let(:value) { "01:02:03" }

      it { is_expected.to eq value }
    end

    context "when :decimal" do
      let(:type) { :decimal }
      let(:value) { 1234567.89 }

      it { is_expected.to eq "1,234,567.89" }
    end

    context "when :float" do
      let(:type) { :float }
      let(:value) { 123456.789 }

      it { is_expected.to eq "123,456.789" }
    end

    context "when :integer" do
      let(:type) { :integer }
      let(:value) { 123456789 }

      it { is_expected.to eq "123,456,789" }
    end

    context "when :string" do
      let(:type) { :string }
      let(:value) { Faker::Lorem.sentence }

      it { is_expected.to eq value }
    end

    context "when anything else" do
      let(:type) { Faker::Internet.domain_word }
      let(:value) { double }

      it { is_expected.to eq value }
    end
  end
end
