# frozen_string_literal: true

RSpec.describe TestMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { object_class.new }
  let(:object_class) { Class.new }

  before { stub_const("Plumbus", object_class) }

  it { is_expected.to inherit_from Material::Base }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :question }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to be_nil }
  end

  describe "#title" do
    subject { material.title }

    it { is_expected.to eq "Plumbus" }
  end

  describe "#parameterized_title" do
    subject { material.parameterized_title }

    it { is_expected.to eq "plumbus" }
  end

  describe "#list_title" do
    subject { material.list_title }

    it { is_expected.to eq "Plumbus" }
  end

  describe "#index_title" do
    subject { material.index_title }

    it { is_expected.to eq "Plumbuses" }
  end

  describe "#header_title" do
    subject { material.header_title }

    it { is_expected.to eq "Plumbus" }
  end

  describe "#reference_title" do
    subject { material.reference_title }

    it { is_expected.to eq "Plumbus" }
  end

  describe "#breadcrumb_title" do
    subject { material.breadcrumb_title }

    it { is_expected.to eq "Plumbus" }
  end

  describe "#breadcrumb_index_title" do
    subject { material.breadcrumb_index_title }

    it { is_expected.to eq "Plumbuses" }
  end
end
