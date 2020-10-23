module Helpers
  module FileSpecHelper
    class << self

      def image
        File.open(Dir[path_to('images')].sample)
      end

      def avatar
        File.open(Dir[path_to_file('default_avatar.png')].sample)
      end

      def banner
        File.open(Dir[path_to_file('default_banner.png')].sample)
      end

      private

      def path_to(folder)
        Rails.root.join('spec', 'samples', folder, '*')
      end

      def path_to_file(file)
        Rails.root.join('spec', 'samples', 'images', file)
      end
    end
  end
end
