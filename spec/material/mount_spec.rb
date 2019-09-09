# frozen_string_literal: true

RSpec.describe Material::Mount, type: :concern do
  include_context "with an example list"

  describe "#mount_facet" do
    subject(:mount_facet) { example_list.mount_facet(facet) }

    let(:facet) { double(output: output) }
    let(:output) { double(current_page: current_page, total_pages: total_pages) }
    let(:current_page) { rand(2..10) }
    let(:total_pages) { 10 }

    before { allow(example_list).to receive(:concat) }

    it "sets values and results" do
      expect { mount_facet }.
        to change { example_list.current_page }.from(1).to(current_page).
        and change { example_list.total_pages }.from(1).to(total_pages)

      expect(example_list).to have_received(:concat).with(output)
    end
  end
end
