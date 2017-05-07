module ApplicationHelper
    def randomized_background_image
        images = ['food1.jpg', 'food2.jpg', 'food3.jpg', 'food4.jpg', 'food5.jpg', 'food6.jpg', 'food7.jpg', 'food8.jpg', 'food9.jpg', 'food10.jpg', 'junk1.jpg']
        images[rand(images.size)]
    end
end
