# frozen_string_literal: true

RSpec.describe TestList, type: :list do
  subject { described_class }

  it { is_expected.to inherit_from Material::List }
end
