# frozen_string_literal: true

json.extract! folder, :id, :name, :description, :category_id, :created_at, :updated_at
json.url folder_url(folder, format: :json)
