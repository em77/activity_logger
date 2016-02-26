class Log < ActiveRecord::Base
  def self.paginated(to_paginate, page_params, num_per_page = 25)
    to_paginate.paginate(page: page_params, per_page: num_per_page)
  end
end
