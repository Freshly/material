# frozen_string_literal: true

RSpec.shared_context "with an example material" do
  subject(:example_material) { example_material_class.new(source) }

  let(:example_material_class) { Class.new(Material::Base) }

  let(:source) { double }

  let(:root_name) { Faker::Internet.domain_word.capitalize }
  let(:example_material_name) { "#{root_name}Material" }

  before { stub_const(example_material_name, example_material_class) }
end
