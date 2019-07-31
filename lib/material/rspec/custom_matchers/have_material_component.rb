# frozen_string_literal: true

# RSpec matcher that tests usages of `.register_component`
#
#     class ExampleMaterial < ApplicationMaterial
#       register_component :foo
#     end
#
#     RSpec.describe ExampleMaterial do
#       it { is_expected.to have_material_component :foo }
#     end

RSpec::Matchers.define :have_material_component do |component_name|
  match { test_subject._components[component_name].instance_of?(Material::Components::Component) }
  description { "have material component #{component_name}" }
  failure_message { "expected #{test_subject} to have material component #{component_name}" }
  failure_message_when_negated { "expected #{test_subject} have material component #{component_name}" }

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
