class NewCommand < Command

  def execute
   @item = Item.new(item_options)
   @item.save!
  end

  def response
    "Task added: #{@item.description}"
  end
end
