require_relative 'repository'
require_relative 'view'

class Controller
  def initialize(crystals)
    @crystals = crystals
    @view = View.new
  end

  # List all crystals
  def list
    display_crystals
  end

  private

  def display_crystals
    # 1. Fetch crystals from repo
    crystals = @crystals.all
    # 2. Send to view to display
    @crystals.display(crystals)
  end
end
