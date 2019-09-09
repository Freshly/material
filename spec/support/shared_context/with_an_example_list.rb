# frozen_string_literal: true

RSpec.shared_context "with an example list" do
  subject(:example_list) { example_list_class.new(source) }

  let(:example_list_class) { Class.new(Material::List) }

  let(:source) { [] }

  let(:root_name) { Faker::Internet.domain_word.capitalize }
  let(:example_material_name) { "#{root_name}List" }

  before { stub_const(example_material_name, example_list_class) }
end
