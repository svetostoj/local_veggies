json.extract! profile, :id, :user_id, :fullname_company, :image_data, :short_bio, :mobile, :account_number, :created_at, :updated_at
json.url profile_url(profile, format: :json)
