module ItemContainer
  module ClassMethods
    def show_all_items
      puts "All items:"
      @items.each { |item| puts item.to_s }
    end
  end
  
  module InstanceMethods
    def add_item(item)
      @items << item
    end

    def remove_item(item)
      @items.delete(item)
    end

    def delete_items
      @items = []
    end

    def method_missing(method_name, *args, &block)
      if method_name.to_s.start_with?('show_all_')
        category = method_name.to_s.split('_').last
        show_all_items_in_category(category)
      else
        super
      end
    end

    private

    def show_all_items_in_category(category)
      puts "All items in category '#{category}':"
      items_in_category = @items.select { |item| item.category == category }
      items_in_category.each { |item| puts item.to_s }
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
end