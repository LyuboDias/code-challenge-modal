class CyclesController < ApplicationController
  def index
    @cycles = Cycle.where(public_status: true)
    # @cycles = Cycle.all
  end
end
