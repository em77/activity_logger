class Log < ActiveRecord::Base
  enum status: [:not_processed, :processed]
  include OrderQuery
  include PgSearch
  order_query :order_home,
    [:created_at, :desc]

  validates :date, presence: { message: "- Please select Date from the calendar helper -" }

  # Default number of logs per page with will_paginate
  self.per_page = 25

  pg_search_scope :search_logs, against: [
                                          :staff_last_name,
                                          :member_last_name,
                                          :member_first_name
                                         ],
                  using: { tsearch: { dictionary: "english" } }

  def self.search(search)
    if search
      self.search_logs(search)
    else
      all
    end
  end
end
