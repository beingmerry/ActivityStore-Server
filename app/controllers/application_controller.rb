# frozen_string_literal: true

# ApplicationController class inheriting from Sinatra::Base
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/' do
    'Welcome to the Phase 3 Backend with Sintatra'
  end
  # ----------ACTIVITIES ROUTES ----------
  get '/activities' do
    activity = Activity.all
    activity.to_json
  end
  post '/activities' do
    activity =
      Activity.create(
        activity_name: params[:activity_name],
        item_first: params[:item_first],
        item_second: params[:item_second],
        item_third: params[:item_third]
      )
    activity.to_json
  end
  patch '/activities/:id' do
    activity = Activity.find(params[:id])
    activity.update(
      activity_name: params[:activity_name],
      item_first: params[:item_first],
      item_second: params[:item_second],
      item_third: params[:item_third]
    )
    activity.to_json
  end
  delete '/activities/:id' do
    activity = Activity.find(params[:id])
    activity.destroy
    activity.to_json
  end
  # ----------STORE ROUTES ----------
  get '/stores' do
    store = Store.all
    store.to_json
  end

  post '/stores' do
    store =
      Store.create(
        store_name: params[:store_name],
        address: params[:address],
        item_1: params[:item_1],
        item_1_cost: params[:item_1_cost],
        item_2: params[:item_2],
        item_2_cost: params[:item_2_cost],
        item_3: params[:item_3],
        item_3_cost: params[:item_3_cost],
        item_4: params[:item_4],
        item_4_cost: params[:item_4_cost]
      )
    store.to_json
  end

  patch '/stores/:id' do
    store = Store.find(params[:id])
    store.update(
      store_name: params[:store_name],
      address: params[:address],
      item_1: params[:item_1],
      item_1_cost: params[:item_1_cost],
      item_2: params[:item_2],
      item_2_cost: params[:item_2_cost],
      item_3: params[:item_3],
      item_3_cost: params[:item_3_cost],
      item_4: params[:item_4],
      item_4_cost: params[:item_4_cost]
    )
    store.to_json
  end

  delete '/stores/:id' do
    store = Store.find(params[:id])
    items = Purchases.all.select { |i| i.store_id == params[:id] }
    items.map { |i| Purchase.find(i.id).update({ store_id: nil }) }
    store.destroy
    store.to_json
  end

  # ----------PURCHASE ROUTES ----------

  get '/purchases' do
    purchase = Purchase.all
    purchase.to_json
  end

  post '/purchases' do
    purchase =
      Purchase.create(
        item_name: params[:item_name],
        review: params[:review],
        star_rating: params[:star_rating],
        cost: params[:cost],
        user_id: params[:user_id],
        store_id: params[:store_id]
      )
    purchase.to_json
  end

  patch '/purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.update(review: params[:review], star_rating: params[:star_rating])
    purchase.to_json
  end

  delete '/purchases/:id' do
    purchase = Purchase.find(params[:id])
    purchase.destroy
    purchase.to_json
  end
  # ----------USERS ROUTES ----------
  get '/users' do
    user = User.all
    user.to_json
  end
  post '/users' do
    user =
      User.create(
        name: params[:name],
        password: params[:password],
        favorite_activity: params[:favorite_activity]
      )
    user.to_json
  end
  patch '/users/:id' do
    user = User.find(params[:id])
    user.update(
      name: params[:name],
      password: params[:password],
      favorite_activity: params[:favorite_activity]
    )
    user.to_json
  end
  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end
  # ----------Has Many to one for ACTIVITIES-to-USERS ROUTES ----------
  #  ⚠️ Not sure how to interact with tables that are joins of two tables only
  # Has many and belongs to many relationships
  # 2023-01-05, 12:07 ET, Ben 🛑
  get '/user/:id/activities' do
    activities = User.find(params[:id]).activities
    activities.to_json
  end
  post '/user/:id/activities' do
    # user = User.find(params[:id])
    # activity = Activity.find(params[:activity_id])
    # binding.pry
    # user.activities
    # User.find(params[:id]).activities.(find[params[:activity_id]])
    # activity =
    #   User
    #     .find(params[:id])
    #     .activities
    #     .create(Activity.find(params[:activity_id]))
    activity.to_json
  end
  # patch '/users/:id' do
  #   user = User.find(params[:id])
  #   user.update(
  #     name: params[:name],
  #     password: params[:password],
  #     favorite_activity: params[:favorite_activity]
  #   )
  #   user.to_json
  # end
  # delete '/users/:id' do
  #   user = User.find(params[:id])
  #   user.destroy
  #   user.to_json
  # end
end
