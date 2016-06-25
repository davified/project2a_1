json.array!(@statics) do |static|
  json.extract! static, :id, :home, :faq, :contact
  json.url static_url(static, format: :json)
end
