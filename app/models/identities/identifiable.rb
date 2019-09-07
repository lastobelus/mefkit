module Identities
  module Identifiable
    extend ActiveSupport::Concern

    included do
      has_many :identities, as: :identifiable
    end

    class_methods do
      def self.create_with_omniauth(info)
        create(name: info["name"])
      end
    end
  end
end
