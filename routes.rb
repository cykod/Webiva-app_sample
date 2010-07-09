

module AppSample

  def self.routes(map)
    map.resources :app_sample_thing, :as => 'things', :controller => 'app_sample/things'
  end

end
