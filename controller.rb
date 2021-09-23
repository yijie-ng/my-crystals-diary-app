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

  # Edit name
  def edit_name!
    # 1. List all crystals
    display_crystals
    # 2. Ask user for crystal id
    id = @view.ask_id
    # 3. Find crystal in repo
    crystal = @crystals.find(id)
    # 4. Ask user for new name
    new_name = @view.ask_name
    # 5. Update crystal to new name
    crystal.instance_variable_set(:@name, new_name)
    # 6. Update list of crystals
    @crystals.save_csv
  end

  # Edit type
  def edit_type!
    # 1. List all crystals
    display_crystals
    # 2. Ask user for crystal id
    id = @view.ask_id
    # 3. Find crystal in repo
    crystal = @crystals.find(id)
    # 4. Ask user for new type
    new_type = @view.ask_type
    # 5. Update crystal to new name
    crystal.instance_variable_set(:@type, new_type)
    # 6. Update list of crystals
    @crystals.save_csv
  end

  # Edit shop
  def edit_shop!
    # 1. List all crystals
    display_crystals
    # 2. Ask user for crystal id
    id = @view.ask_id
    # 3. Find crystal in repo
    crystal = @crystals.find(id)
    # 4. Ask user for new shop
    new_shop = @view.ask_shop
    # 5. Update crystal to new name
    crystal.instance_variable_set(:@shop, new_shop)
    # 6. Update list of crystals
    @crystals.save_csv
  end

  # Edit price
  def edit_price!
    # 1. List all crystals
    display_crystals
    # 2. Ask user for crystal id
    id = @view.ask_id
    # 3. Find crystal in repo
    crystal = @crystals.find(id)
    # 4. Ask user for new price
    new_price = @view.ask_price
    # 5. Update crystal to new name
    crystal.instance_variable_set(:@price, new_price)
    # 6. Update list of crystals
    @crystals.save_csv
  end

  # Edit existing entry
  def edit!
    # 1. Ask user if want to edit name/type/shop/price
    user_edit = @view.ask_edit
    case user_edit
    # 2a. When name, update name
    when "Name" then edit_name!
    # 2b. When type, update type
    when "Type" then edit_type!
    # 2c. When shop, update shop
    when "Shop" then edit_shop!
    # 2d. When price, update price
    when "Price" then edit_price!
    else
      puts "Name/Type/Shop/Price?"
    end
    # 3. List updated crystals
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
