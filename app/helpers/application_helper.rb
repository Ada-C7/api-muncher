module ApplicationHelper
    def randomized_background_image
        images = ['assets/food1.jpg', 'assets/food2.jpg', 'assets/food3.jpg']
        images[rand(images.size)]
    end
end
