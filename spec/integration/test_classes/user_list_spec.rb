# frozen_string_literal: true

RSpec.describe UserList, type: :list do
  subject(:list) { described_class.new(item) }

  let(:item) { User.new }
  let(:object) { double }

  describe ".item_class" do
    subject { described_class.item_class }

    it { is_expected.to eq User }
  end

  it { is_expected.to inherit_from TestList }

  context "with invalid item" do
    let(:item) { SecureRandom.hex }

    it "raises" do
      expect { list }.to raise_error Collectible::ItemNotAllowedError, "not allowed: \"#{item}\""
    end
  end

  describe "#icon" do
    subject { list.icon }

    it { is_expected.to eq :user }
  end

  describe "#icon_title" do
    subject { list.icon_title }

    it { is_expected.to eq "icons.user" }
  end

  describe "#title" do
    subject { list.title }

    it { is_expected.to eq "Users" }
  end

  describe "#index_title" do
    subject { list.index_title }

    it { is_expected.to eq "Users" }
  end

  describe "#parameterized_title" do
    subject { list.parameterized_title }

    it { is_expected.to eq "users" }
  end

  describe "#list_title" do
    subject { list.list_title }

    it { is_expected.to eq "Users" }
  end

  describe "#header_title" do
    subject { list.header_title }

    it { is_expected.to eq "Users" }
  end

  describe "#reference_title" do
    subject { list.reference_title }

    it { is_expected.to eq "Users" }
  end

  describe "#breadcrumb_title" do
    subject { list.breadcrumb_title }

    it { is_expected.to eq "Users" }
  end

  describe "#breadcrumb_index_title" do
    subject { list.breadcrumb_index_title }

    it { is_expected.to eq "Users" }
  end
end
