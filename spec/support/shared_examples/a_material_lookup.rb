# frozen_string_literal: true

RSpec.shared_examples_for "a material lookup" do |subtype|
  subject(:for) { base_class.for(object) }

  let(:subtype_class) { "#{subtype}_class".to_sym }

  context "with object#subtype_class" do
    let(:object) { double(subtype_class => example_class) }

    it { is_expected.to be_an_instance_of example_class }
  end

  context "with object.subtype_class" do
    let(:object) { object_class.new }
    let(:object_class) do
      Class.new.tap { |klass| klass.define_singleton_method(subtype_class) {} }
    end

    before { allow(object_class).to receive(subtype_class).and_return(example_class) }

    it { is_expected.to be_an_instance_of example_class }
  end

  context "without explicit declaration" do
    let(:object) { object_class.new }
    let(:object_class) { Class.new }

    before { stub_const(root_name, object_class) }

    it { is_expected.to be_an_instance_of example_class }
  end
end
