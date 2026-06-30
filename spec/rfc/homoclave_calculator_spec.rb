# frozen_string_literal: true

RSpec.describe Rfc::HomoclaveCalculator do
  describe "#calculate" do
    it "returns the homoclave for a natural person full name" do
      calculator = described_class.new(
        name: "Juan Carlos",
        first_last_name: "Perez",
        second_last_name: "Garcia"
      )

      expect(calculator.calculate).to eq("PE")
    end

    it "preserves Ñ characters after transliteration" do
      calculator = described_class.new(
        name: "Peña",
        first_last_name: "Nuñez",
        second_last_name: "Ibarra"
      )

      expect(calculator.calculate).to match(/\A[0-9A-Z]{2}\z/)
    end
  end
end
