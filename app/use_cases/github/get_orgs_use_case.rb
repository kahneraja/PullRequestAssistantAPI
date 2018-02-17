module Github

  class GetOrgsUseCase

    def initialize(gateway = GithubGateway.new)
      @gateway = gateway
    end

    def execute(token)
      @gateway.get_orgs(token)
    end

  end

end
