require './lib/dish'

class Potluck
  attr_reader :date,
              :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all do |dish|
      dish if dish.category == category
    end
  end

  def menu
    menu = {}

    categories = @dishes.map do |dish|
      dish.category
    end.uniq

    categories.each do |category|
      menu["#{category}s".to_sym] = get_all_from_category(category).map do |dish|
        dish.name
      end.sort
    end
    menu
  end

  def ratio(category)
    ((get_all_from_category(category).length / @dishes.length.to_f) * 100).round(2)
  end
end
