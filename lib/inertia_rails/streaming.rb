# frozen_string_literal: true

require 'action_cable'

module InertiaRails
  module Streaming
    module ControllerMethods
      def inertia_stream(channel, **data)
        { channel: channel, data: data }
      end

      def broadcast_inertia_patch(channel_class, record, props = {})
        channel_class.broadcast_to(
          record,
          type: 'inertia:patch',
          payload: {
            props: props,
          }
        )
      end

      def broadcast_inertia_update(channel_class, record, props = {})
        channel_class.broadcast_to(
          record,
          type: 'inertia:update',
          payload: {
            props: props,
          }
        )
      end
    end
  end
end
