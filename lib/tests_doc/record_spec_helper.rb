module TestsDoc

  module RecordSpecHelper

    def recording_api_interaction(path: nil, key: nil, description: nil, whitelist: nil)
      TestsDoc.recorded_api_interaction = true
      TestsDoc.interaction_options      = OpenStruct.new(path: path, key: key, description: description, whitelist: whitelist)

      yield TestsDoc.interaction_options
    ensure
      TestsDoc.interaction_options = nil
    end

    def get(*, **)
      record_interaction { super }
    end

    def post(*, **)
      record_interaction { super }
    end

    def put(*, **)
      record_interaction { super }
    end

    def delete(*, **)
      record_interaction { super }
    end

    private

      def record_interaction
        result = yield

        if TestsDoc.interaction_options
          TestsDoc::Interaction.new(
            RSpec.respond_to?(:current_example) ? RSpec.current_example : example,
            request,
            response,
            TestsDoc.interaction_options
          ).record
        end

        result
      end

    # /private

  end

end
