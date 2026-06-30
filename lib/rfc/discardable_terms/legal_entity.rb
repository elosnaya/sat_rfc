# frozen_string_literal: true

module Rfc
  module DiscardableTerms
    # Dictionary of discardable terms for legal entities (personas morales).
    # Based on SAT specification.
    #
    # After normalization, terms like "S.A. de C.V." become "SA DE CV" (separate words),
    # so individual abbreviations and words are listed here.
    module LegalEntity
      ARTICLES_AND_PREPOSITIONS = %w[
        DE LA LAS DEL LOS Y EL
        PARA POR AL E EN CON SUS
        OF THE AND
      ].freeze

      COMPANY_TYPE_ABBREVIATIONS = %w[
        SA SC SRL SCL SNC SCS CIA COOP SOC CO COMPANY
        CV RL
      ].freeze

      SINGLE_LETTER_ABBREVIATIONS = %w[S A C V].freeze

      COMPANY_TYPE_WORDS = %w[
        COMPAÑIA SOCIEDAD COOPERATIVA
        ANONIMA COMANDITA RESPONSABILIDAD LIMITADA
        PROMOTORA INVERSION CAPITAL VARIABLE NOMBRE COLECTIVO
      ].freeze

      DISCARDABLE_TERMS = %w[MC VON MAC VAN MI].freeze

      ALL = (
        ARTICLES_AND_PREPOSITIONS +
        COMPANY_TYPE_ABBREVIATIONS +
        SINGLE_LETTER_ABBREVIATIONS +
        COMPANY_TYPE_WORDS +
        DISCARDABLE_TERMS
      ).freeze
    end
  end
end
