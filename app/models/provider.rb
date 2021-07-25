class Provider < ApplicationRecord
  validates :api_token, presence: true, if: :api_token_required?

  def self.to_csv
    require 'csv'
    fields = ['name', 'shortened_links_count']

    CSV.generate(headers: true) do |csv|
      csv << fields

      all.each do |provider|
        csv << fields.map{ |f| provider.send(f) }
      end
    end
  end
end
