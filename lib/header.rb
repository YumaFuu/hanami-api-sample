class Header
  class << self
    def default
      cors.merge(
        json,
        seculity,
      )
    end

    def cors
      {
        "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Methods" =>
          %w(GET POST PUT PATCH OPTIONS DELETE) * ",",
        "Access-Control-Allow-Headers" =>
          %w(Content-Type Accept Auth-Token Authorization) * ",",
      }
    end

    def json
      {
        "Content-Type" => "application/json",
      }
    end

    def seculity
      {
        "X-Content-Type-Options" => "nosniff",
        "X-Frame-Options" => "DENY",
        "X-Xss-Protection" => "1; mode=block",
        "Content-Security-Policy" => "
          form-action 'self';
          frame-ancestors 'self';
          base-uri 'self';
          default-src 'none';
          script-src 'self';
          connect-src 'self';
          img-src 'self' https: data:;
          style-src 'self' 'unsafe-inline' https:;
          font-src 'self';
          object-src 'none';
          plugin-types application/pdf;
          child-src 'self';
          frame-src 'self';
          media-src 'self';
        ".gsub("\n", " ")
      }
    end
  end
end
