class Post < ActiveRecord::Base
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :title, presence: true
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?


  def is_clickbait?
    if [ /Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/].none? {|click| click.match title}
      errors.add(:title, "must be clickbait")
    end
  end

end
