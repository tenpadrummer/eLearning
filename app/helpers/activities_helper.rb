# frozen_string_literal: true

module ActivitiesHelper
  def rel_activity(id) #
    Relationship.find(id).followed
  end
end
