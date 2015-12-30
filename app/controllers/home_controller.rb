class HomeController < ApplicationController

  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.json({ link: home_url(user) })
      if user.attachments.present?
        marker.picture({"url" => user.attachments.first.photo.url,
                        "width" =>  32,
                        "height" => 32})
      else
        marker.picture({"url" => "/assets/map_logo.jpg",
                        "width" =>  32,
                        "height" => 32})
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
