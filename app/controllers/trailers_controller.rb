class TrailersController < InheritedResources::Base

  private

    def trailer_params
      params.require(:trailer).permit()
    end

end
