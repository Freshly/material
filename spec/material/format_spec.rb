# frozen_string_literal: true

RSpec.describe Material::Format, type: :concern do
  include_context "with an example material"

  it { expect(example_material_class).to alias_method :format_time, :format_datetime }
  it { is_expected.to delegate_method(:format_date).to(:class) }
  it { is_expected.to delegate_method(:format_time).to(:class) }
  it { is_expected.to delegate_method(:format_datetime).to(:class) }

  describe ".format_date" do
    subject { example_material_class.format_date(date) }

    let(:date) { Date.current }

    it { is_expected.to eq date.to_s(:long) }
  end

  describe "#format_datetime" do
    subject { example_material_class.format_datetime(datetime) }

    let(:datetime) { DateTime.current }

    it { is_expected.to eq datetime.to_s(:long) }
  end

  describe "#format_datetime" do
    subject { example_material_class.format_time(time) }

    let(:time) { Time.now }

    it { is_expected.to eq time.to_s(:long) }
  end
end
