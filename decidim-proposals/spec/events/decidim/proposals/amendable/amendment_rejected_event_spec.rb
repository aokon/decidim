# frozen_string_literal: true

require "spec_helper"

module Decidim
  module Amendable
    describe AmendmentRejectedEvent do
      let!(:component) { create(:proposal_component) }
      let!(:amendable) { create(:proposal, component: component, title: "My super proposal") }
      let!(:emendation) { create(:proposal, component: component, title: "My super emendation") }
      let!(:amendment) { create :amendment, amendable: amendable, emendation: emendation }

      include_examples "amendment rejected event"
    end
  end
end
