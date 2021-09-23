require_relative 'repository'
require_relative 'view'

class Controller
  def initialize(crystals)
    @crystals = crystals
    @view = View.new
  end
end
