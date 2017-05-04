module ApplicationHelper
    def randomized_background_image
        images = ['assets/food1.jpg', 'assets/food2.jpg', 'assets/food3.jpg', 'assets/food4.jpg', 'assets/food5.jpg', 'assets/food6.jpg', 'assets/food7.jpg', 'assets/food8.jpg', 'assets/food9.jpg', 'assets/food10.jpg', 'assets/junk1.jpg']
        images[rand(images.size)]
    end
end
