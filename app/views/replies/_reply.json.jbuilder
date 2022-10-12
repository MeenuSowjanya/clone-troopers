# frozen_string_literal: true

json.extract! reply, :id, :description, :ticket_id, :created_at, :updated_at
json.url reply_url(reply, format: :json)
