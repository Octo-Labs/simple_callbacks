require 'aws/record/abstract_base'
require 'active_support/callbacks'
require 'active_model/callbacks'
require 'active_model/validations/callbacks'
module AWS
  module Record
    module AbstractBase

      def self.extended base
        # This first bit is straight from AWS::Record::AbstractBase
        base.send(:extend, ClassMethods)
        base.send(:include, InstanceMethods)
        base.send(:include, DirtyTracking)
        base.send(:extend, Validations)

        # these 3 modules are for rails 3+ active model compatability
        base.send(:extend, Naming)
        base.send(:include, Naming)
        base.send(:include, Conversion)

        # This is the new stuff.
        # These modules provide the callback framework
        base.send(:include,::ActiveSupport::Callbacks)
        base.send(:extend,::ActiveModel::Callbacks)
        base.send(:include,::ActiveModel::Validations::Callbacks)

        # set up some callbacks
        base.send(:define_model_callbacks, :save, :create, :update, :destroy)
      end

      module InstanceMethods
        # Here we transparently wrap the original methods in a 
        # version that runs a run_calbacks block and then delegates
        # to the origin method.
        update_without_callbacks = instance_method(:update)
        define_method :update do
          run_callbacks(:update){ update_without_callbacks.bind(self).() }
        end

        create_without_callbacks = instance_method(:create)
        define_method :create do
          run_callbacks(:create){ create_without_callbacks.bind(self).() }
        end

        save_without_callbacks = instance_method(:save)
        define_method :save do
          run_callbacks(:save){ save_without_callbacks.bind(self).() }
        end

        destroy_without_callbacks = instance_method(:destroy)
        define_method :destroy do
          run_callbacks(:destroy){ destroy_without_callbacks.bind(self).() }
        end
      end

    end
  end
end
