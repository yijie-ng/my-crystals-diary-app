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

  # Add new crystal
  def create
    # 1a. Ask user for crystal name
    name = @view.ask_name
    # 1b. Ask user for crystal type
    type = @view.ask_type
    # 1c. Ask user for shop name
    shop = @view.ask_shop
    # 1d. Ask user for crystal price
    price = @view.ask_price
    # 2. Create new crystal
    crystal = Crystal.new(name: name, type: type, shop: shop, price: price)
    # 3. Add to repo
    @crystals.add(crystal)
    # 4. Display updated list
    display_crystals
  end

  # Remove crystal
  def destroy!
    # 1. List all crystals
    display_crystals
    # 2. Ask user for crystal id
    id = @view.ask_id
    # 3. Find crystal in repo
    crystal = @crystals.find(id)
    # 4. Delete crystal
    @crystals.remove(crystal)
    # 5. List updated list
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
