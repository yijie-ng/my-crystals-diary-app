require 'csv'
require_relative 'crystal'

class Repository
  def initialize(csv_file)
    @file = csv_file
    @crystals = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  # List all crystals
  def all
    @crystals
  end

  # Find crystal using id
  def find(id)
    @crystals.find { |crystal| crystal.id == id }
  end

  # Add crystal
  def add(crystal)
    crystal.id = @next_id
    @crystals << crystal
    @next_id += 1
    save_csv
  end

  # Remove crystal
  def remove(crystal)
    @crystals.delete(crystal)
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @crystals << Crystal.new(row)
      @next_id = @crystals.empty? ? 1 : @crystals.last.id + 1
    end
  end

  def save_csv
    column_header = %w[id name type shop price]
    CSV.open(@file, 'wb', write_headers: true, headers: column_header) do |csv|
      @crystals.each do |crystal|
        csv << [crystal.id, crystal.name, crystal.type, crystal.shop, crystal.price]
      end
    end
  end
end
