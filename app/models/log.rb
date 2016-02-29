class Log < ActiveRecord::Base
  enum status: [:not_processed, :processed]

  def self.paginated(page_params, num_per_page = 25)
    self.paginate(page: page_params, per_page: num_per_page)
  end
end
