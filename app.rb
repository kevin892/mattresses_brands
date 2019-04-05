class Application < Sinatra::Base
  use Rack::MethodOverride

  use BrandsController
  use MattressesController
end
