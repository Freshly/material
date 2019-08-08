# frozen_string_literal: true

RSpec.describe TestList, type: :list do
  subject(:list) { described_class.new(item) }

  let(:item) { double }

  it { is_expected.to inherit_from Material::List }

  describe "#count" do
    subject { list.count }

    it { is_expected.to eq 1 }
  end

  describe "#first" do
    subject { list.first }

    it { is_expected.to eq item }
  end

  describe "#icon" do
    subject { list.icon }

    it { is_expected.to eq :questions }
  end

  describe "#icon_title" do
    subject { list.icon_title }

    it { is_expected.to be_nil }
  end
end
