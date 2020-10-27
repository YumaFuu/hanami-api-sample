module Api
  module Action
    private

    def response(body, status: 200, headers: {})
      body = body.to_json

      [status, headers, [body]]
    end
  end
end
