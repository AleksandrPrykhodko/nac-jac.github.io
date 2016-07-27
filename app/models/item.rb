class Item
  ITEMS = [
    {
      id: 1,
      title: 'NAC-JAC TRAY',
      description: 'Tray description',
      price: 16.99
    },
    {
      id: 2,
      title: 'NANAC-JAC FILE FOLDERS',
      description: 'Folders description',
      price:16.99
    },
    {
      id: 3,
      title: 'NAC-JAC TRAYS',
      description: 'Trays description',
      price: 60.00
    }
  ].freeze

  def self.find(id)
    ITEMS.find { |product| product[:id] == id.to_i }
  end

  def self.all
    ITEMS
  end
end
