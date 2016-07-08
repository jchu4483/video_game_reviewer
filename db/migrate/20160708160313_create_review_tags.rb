class CreateReviewTags < ActiveRecord::Migration
  def change
    create_table :review_tags do |t|
      t.integer :review_id
      t.integer :tag_id
    end
  end
end
