class AutosyncRunnersController < AuthenticatedController
  def index
    @autosync_runners = @shop.autosync_runners
  end
end
