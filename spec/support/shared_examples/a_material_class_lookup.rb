# frozen_string_literal: true

RSpec.shared_examples_for "a material class lookup" do
  subject(:for_class) { base_class.for_class(object) }

  let(:object) { object_class.new }
  let(:object_class) do
    Class.new do
      include Conjunction::Conjunctive
    end
  end

  context "with explicit override" do
    before { object_class.__send__(:conjoins, example_class) }

    it { is_expected.to eq example_class }
  end

  context "with invalid input" do
    let(:object) { Faker::Lorem.word }

    it { is_expected.to be_nil }
  end

  context "without explicit declaration" do
    context "with match" do
      before { stub_const(root_name, object_class) }

      it { is_expected.to eq example_class }
    end

    context "without matching" do
      let(:other_name) { "#{root_name}x" }

      before { stub_const(other_name, object_class) }

      it "raises" do
        expect { for_class }.
          to raise_error Conjunction::DisjointedError, "#{other_name} disjointed with #{base_class.name}"
      end
    end
  end
end
