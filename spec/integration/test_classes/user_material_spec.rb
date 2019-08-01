# frozen_string_literal: true

RSpec.describe UserMaterial, type: :material do
  subject(:material) { described_class.new(object) }

  let(:object) { double }

  it { is_expected.to inherit_from TestMaterial }

  describe "#icon" do
    subject { material.icon }

    it { is_expected.to eq :user }
  end

  describe "#icon_title" do
    subject { material.icon_title }

    it { is_expected.to eq "icons.user" }
  end

  describe "#title" do
    subject { material.title }

    it { is_expected.to eq "user title" }
  end

  describe "#list_title" do
    subject { material.list_title }

    it { is_expected.to eq "user list title" }
  end

  describe "#header_title" do
    subject { material.header_title }

    it { is_expected.to eq "user header title" }
  end

  describe "#reference_title" do
    subject { material.reference_title }

    it { is_expected.to eq "user reference title" }
  end

  describe "#breadcrumb_title" do
    subject { material.breadcrumb_title }

    it { is_expected.to eq "user breadcrumb title" }
  end
end
