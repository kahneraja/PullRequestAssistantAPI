class StubHttpClient

  def initialize(responseCode, responseBody)
    @responseCode = responseCode
    @responseBody = responseBody
  end

  def post(url, options)
    StubHttpPost.new(@responseCode,@responseBody)
  end

  def get(url, options)
    StubHttpPost.new(@responseCode,@responseBody)
  end
end

class StubHttpPost

  def initialize(responseCode, responseBody)
    @responseCode = responseCode
    @responseBody = responseBody
  end

  def response
    StubHttpResponse.new(@responseCode,@responseBody)
  end

  end

class StubHttpResponse

  def initialize(responseCode, responseBody)
    @responseCode = responseCode
    @responseBody = responseBody
  end

  def code
    @responseCode
  end

  def body
    @responseBody
  end

end