class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attr|
      if !category_attr[:name].empty? 
        category = Category.find_or_create_by(category_attr)
        self.post_categories.build(:category => category)
      end
    end
  end

end
