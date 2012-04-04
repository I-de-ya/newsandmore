class AddTranslationTablesToModels < ActiveRecord::Migration
  def up
    Broadcast.create_translation_table! :title => :string
    Dish.create_translation_table! :name => :string, :description => :text
    DishCategory.create_translation_table! :name => :string
    DishType.create_translation_table! :title => :string
    Event.create_translation_table! :title => :string, :body => :text
    Image.create_translation_table! :title => :string
    Movie.create_translation_table! :title => :string,
                                    :origin => :string,
                                    :genre => :string,
                                    :description => :text,
                                    :director => :string,
                                    :starring => :string,
                                    :country => :string
    Note.create_translation_table! :title => :string, :body => :text
    Post.create_translation_table! :title => :string, :body => :text
    Section.create_translation_table! :title => :string, :body => :text
    Slider.create_translation_table! :title => :string
    Sport.create_translation_table! :title => :string
  end

  def down
    Broadcast.drop_translation_table!
    Dish.drop_translation_table!
    DishCategory.drop_translation_table!
    DishType.drop_translation_table!
    Event.drop_translation_table!
    Image.drop_translation_table!
    Movie.drop_translation_table!
    Note.drop_translation_table!
    Post.drop_translation_table!
    Section.drop_translation_table!
    Slider.drop_translation_table!
    Sport.drop_translation_table!
  end
end