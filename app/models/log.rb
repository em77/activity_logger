class Log < ActiveRecord::Base
  enum status: [:not_processed, :processed]
  include OrderQuery
  order_query :order_home,
    [:created_at, :desc]

  # Default number of logs per page with will_paginate
  self.per_page = 25
end
