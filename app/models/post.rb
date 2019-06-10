class Post < ActiveRecord::Base
  validates :title, {presence: true}
  validates :content, {length: {minimum: 250}}
  validates :summary, {length: {maximum: 250}}

  validates :category, {inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not included in category."}}
  validate :must_be_clickbaity

  def must_be_clickbaity
    unless title == nil
      unless title.include?("Won't Believe") ||  title.include?("Secret") || title.include?("Top") || title.include?("Guess")
        errors.add(:title, 'Need to be clickbaity!')
      end
    end
  end

end
