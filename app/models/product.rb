class Product < ActiveRecord::Base
  attr_accessible :description, :name, :on_sale, :price, :qty, :picture, :category_ids
  validates_presence_of :description, :name, :price, :qty
  validates_uniqueness_of :name
  validates_numericality_of :price, :qty, greater_than_or_equal_to: 0

  has_many :categorizations
  has_many :categories, through: :categorizations

  scope :featured, where("created_at > :recent", { recent: 12.hour.ago })
  scope :available, where("on_sale = :for_sale AND qty > 0", for_sale: true)
  self.per_page = 6

  extend FriendlyId
  friendly_id :name, use: :slugged

  include PgSearch
  pg_search_scope :search, against: [ :name, :description ],
    using: { tsearch: { dictionary: "english"} }

  # Text is belongs to helper more
  def on_sale_text
    value = self.on_sale ? "Yes" : "No"
  end

  def in_stock?
    self.on_sale && self.qty > 0
  end

  mount_uploader :picture, PictureUploader

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
                               
  # move to observer or mailer directly
  def self.deliver_notification(user_name, user_email, product_name)
    PriceChangeNotifier.notification(user_name, user_email, product_name)
      .deliver
  end

end
