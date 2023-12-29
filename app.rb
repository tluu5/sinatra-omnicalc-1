require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  apr = params.fetch("apr_num").to_f
  @apr_percent = apr.to_fs(:percentage, {:precision => 4})
  @years = params.fetch("years_num").to_i
  principal = params.fetch("principal_num").to_f
  @principal_dollar = principal.to_fs(:currency)
  r = apr / 100 / 12
  n = r * principal
  d = 1 - (1 + r) ** -(@years * 12)
  pmt = n / d
  @pmayt = pmt.to_fs(:currency)
  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min = params.fetch("min_num").to_f
  @max = params.fetch("max_num").to_f
  random_float = rand(@min..@max)
  @random_num = random_float.round(15)
  erb(:random_results)
end
