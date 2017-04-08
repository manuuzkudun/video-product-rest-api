Purchase.destroy_all
PurchaseOption.destroy_all
User.destroy_all
Movie.destroy_all
Season.destroy_all

user = User.new email: 'manuuzkudun@gmail.com'

movie1 = Movie.create! title: 'ET', plot: 'The alien'
movie2 = Movie.create! title: 'Indiana 1', plot: 'Awesome adventure'

season1 = Season.create! title: 'Lost season 1', plot: 'mystery'
season2 = Season.create! title: 'Lost season 2', plot: 'strange'

episode1 = Episode.create! title: 'Episode 1 title', plot: 'Episode 1 plot', season: season1, episode_in_season: 1

purchase_option1 = PurchaseOption.create! price_cents: 100, price_currency: 'EUR', video_quality: 'HD'

purchase1 = Purchase.create! user: user, video_product: season1, purchase_option: purchase_option1
purchase2 = Purchase.create! user: user, purchase_option: purchase_option1, video_product: movie1

