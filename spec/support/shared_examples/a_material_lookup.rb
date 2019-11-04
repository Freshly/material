# frozen_string_literal: true

RSpec.shared_examples_for "a material lookup" do
  subject(:_for) { base_class.for(object) }

  let(:object) { object_class.new }
  let(:object_class) do
    Class.new do
      include Spicerack::Conjugatable
    end
  end

  context "with explicit override" do
    before { object_class.__send__(:conjoin, example_class) }

    it { is_expected.to be_an_instance_of example_class }
  end

  context "with invalid input" do
    let(:object) { Faker::Lorem.word }

    it { is_expected.to be_nil }
  end

  context "without explicit declaration" do
    context "with match" do
      before { stub_const(root_name, object_class) }

      it { is_expected.to be_an_instance_of example_class }
    end

    context "without matching" do
      let(:other_name) { "#{root_name}x" }

      before { stub_const(other_name, object_class) }

      it "raises" do
        expect { _for }.to raise_error NameError
      end
    end
  end
end
