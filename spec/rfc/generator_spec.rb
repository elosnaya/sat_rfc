# frozen_string_literal: true

RSpec.describe Rfc::Generator do
  subject(:generator) { described_class.new }

  describe "#generate" do
    it "returns the full RFC for a natural person using date_of_birth" do
      rfc = generator.generate(
        name: "Luis Alberto",
        first_last_name: "Osnaya",
        second_last_name: "Balderas",
        date_of_birth: "21/07/1986"
      )

      expect(rfc).to eq("OABL8607213H6")
    end

    it "returns the full RFC when day, month, and year are provided" do
      rfc = generator.generate(
        name: "Luis Alberto",
        first_last_name: "Osnaya",
        second_last_name: "Balderas",
        day: 21,
        month: 7,
        year: 1986
      )

      expect(rfc).to eq("OABL8607213H6")
    end

    it "raises InvalidDateError when date information is missing" do
      expect do
        generator.generate(
          name: "Luis Alberto",
          first_last_name: "Osnaya",
          second_last_name: "Balderas"
        )
      end.to raise_error(Rfc::Generator::InvalidDateError, "Date information missing")
    end

    it "raises InvalidDateError when date_of_birth has an invalid format" do
      expect do
        generator.generate(
          name: "Luis Alberto",
          first_last_name: "Osnaya",
          second_last_name: "Balderas",
          date_of_birth: "not-a-date"
        )
      end.to raise_error(Rfc::Generator::InvalidDateError, /Invalid date format/)
    end
  end
end
