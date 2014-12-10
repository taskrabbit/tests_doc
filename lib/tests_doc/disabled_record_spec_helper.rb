module TestsDoc
  module DisabledRecordSpecHelper
    def recording_api_interaction(*)
      yield OpenStruct.new
    end
  end
end