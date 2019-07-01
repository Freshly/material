# frozen_string_literal: true

RSpec.describe Material do
  it "has a version number" do
    expect(Material::VERSION).not_to be nil
  end
end
