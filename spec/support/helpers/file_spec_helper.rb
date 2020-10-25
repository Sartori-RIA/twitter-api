# frozen_string_literal: true

module Helpers
  module FileSpecHelper
    class << self
      def image
        File.open(Dir[path_to('images')].sample)
      end

      def avatar
        File.open(path_to_file('default_avatar.png'))
      end

      def banner
        File.open(path_to_file('default_banner.jpeg'))
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
