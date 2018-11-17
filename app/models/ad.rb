class Ad < ActiveRecord::Base

  QTD_PER_PAGE = 6
  CAROUSEL_NUMBER = 3

  ratyrate_rateable "quality"

  # Callback Active Record
  before_save :md_to_html

  belongs_to :category, counter_cache: true
  belongs_to :member
  has_many :comments

  validates :title, :description_md, :description_short,
            :category, :picture, :finish_date, presence: true

  validates :price, numericality: { greater_than: 0 }

  monetize :price_cents

  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  scope :last_six, -> { limit(QTD_PER_PAGE).order(created_at: :desc) }
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(QTD_PER_PAGE) }
  scope :to_member, ->(member) { where(member: member) }
  scope :filter_category, -> (id, page) { where(category: id).page(page).per(QTD_PER_PAGE) }
  scope :search, -> (term, page) { where("title LIKE ?", "%#{term}%").page(page).per(QTD_PER_PAGE) }
  scope :carousel_random, -> { limit(CAROUSEL_NUMBER).order("RANDOM()")}


  def second
    self[1]
  end

  def third
    self[2]
  end

  private

    def md_to_html

      options = {
          filter_html: true,
          link_attributes: {
              rel: "nofollow",
              target: "_blank"
          }
      }

      extensions = {
          space_after_headers: true,
          autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      self.description = markdown.render(self.description_md)

    end

end
