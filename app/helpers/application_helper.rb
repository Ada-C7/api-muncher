module ApplicationHelper
  def randomized_background_image
    images = ["assets/back1.jpg", "assets/back2.jpg", "assets/back3.jpg", "assets/back4.jpg"]
    images[rand(images.size)]
  end
end
