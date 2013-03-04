require 'rails'

module ImageOptimRake
  class Railtie < ::Rails::Railtie
    railtie_name :image_optim_rake

    rake_tasks do
      ImageOptimTask.new
    end
  end
end
