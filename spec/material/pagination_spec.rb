# frozen_string_literal: true

RSpec.describe Material::Pagination, type: :concern do
  include_context "with an example list"

  describe "#current_page" do
    subject { example_list.current_page }

    context "when unspecified" do
      it { is_expected.to eq 1 }
    end

    context "when specified" do
      let(:current_page) { rand(2..10) }

      let(:example_list) { example_list_class.new(source, current_page: current_page) }

      it { is_expected.to eq current_page }
    end
  end

  describe "#total_pages" do
    subject { example_list.total_pages }

    context "when unspecified" do
      it { is_expected.to eq 1 }
    end

    context "when specified" do
      let(:total_pages) { rand(2..10) }

      let(:example_list) { example_list_class.new(source, total_pages: total_pages) }

      it { is_expected.to eq total_pages }
    end
  end
end
