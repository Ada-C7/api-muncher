class HomepagesController < ApplicationController
    layout 'homeapplication', only: [:root]

    def root; end
end
