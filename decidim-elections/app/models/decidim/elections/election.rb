# frozen_string_literal: true

module Decidim
  module Elections
    # The data store for an Election in the Decidim::Elections component. It stores a
    # title, description and any other useful information to perform an election.
    class Election < ApplicationRecord
      include Decidim::Publicable
      include Decidim::Resourceable
      include Decidim::HasComponent
      include Traceable
      include Loggable

      component_manifest_name "elections"

      def self.log_presenter_class_for(_log)
        Decidim::AdminLog::ElectionPresenter
      end

      def started?
        start_time <= Time.current && published_at.present?
      end

      def finished?
        end_time < Time.current
      end
    end
  end
end
