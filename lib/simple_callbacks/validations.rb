module AWS
  module Record
    module Validations

      def self.extended base
        # This is the original declaration of :run_validations from 
        # AWS::Record::Validations.  The name has just been changed.
        base.send(:define_method, :run_validations_without_callbacks) do
          errors.clear!
          self.class.send(:validators).each do |validator|
            validator.validate(self)
          end
        end
        base.send(:private, :run_validations_without_callbacks)

        # This just wraps the other validation method in a run_callbacks block.
        base.send(:define_method, :run_validations) do
          run_callbacks(:validation){ run_validations_without_callbacks }
        end
        base.send(:private, :run_validations)
      end

    end
  end
end
