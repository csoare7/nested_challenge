Rails.application.routes.draw do
  get "regions/:name/inflated_price", to: "regions#inflate_price"
end
