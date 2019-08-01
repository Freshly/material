# frozen_string_literal: true

# RSpec matcher that tests usages of `.register_component`
#
#     class ExampleMaterial < ApplicationMaterial
#       register_component :foo
#       register_component :bar, max_length: 10
#     end
#
#     RSpec.describe ExampleMaterial do
#       it { is_expected.to have_material_component :foo }
#       it { is_expected.to have_material_component(:bar).with_options(max_length: 10) }
#     end

RSpec::Matchers.define :have_material_component do |component_name|
  match do
    @component = test_subject._components[component_name]

    @component.present? && @component.instance_of?(Material::Components::Component) && options_matching?
  end

  def options_matching?
    if @options.present?
      @options.keys.all? { |option| @component.options[option] == @options[option] }
    else
      true
    end
  end

  chain :with_options do |options|
    @options = options
  end

  description do
    "have material component #{component_name}#{" with options #{@options}" if @options.present?}"
  end

  failure_message do
    "expected to have material component #{component_name}#{" with options #{@options}" if @options.present?}"
  end

  failure_message_when_negated do
    "not expected to have material component #{component_name}#{" with options #{@options}" if @options.present?}"
  end

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
