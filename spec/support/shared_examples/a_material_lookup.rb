# frozen_string_literal: true

RSpec.shared_examples_for "a material lookup" do
  subject(:for) { base_class.for(object) }

  context "with object#material_class" do
    let(:object) { double(material_class: example_class) }

    it { is_expected.to be_an_instance_of example_class }
  end

  context "with object.material_class" do
    let(:object) { object_class.new }
    let(:object_class) do
      Class.new do
        def self.material_class; end
      end
    end

    before { allow(object_class).to receive(:material_class).and_return(example_class) }

    it { is_expected.to be_an_instance_of example_class }
  end

  context "without explicit declaration" do
    let(:object) { object_class.new }
    let(:object_class) { Class.new }

    before { stub_const(root_name, object_class) }

    it { is_expected.to be_an_instance_of example_class }
  end
end
