require 'yaml'

Dir[File.expand_path("../build_configuration/*.rb", __FILE__)].each do |f|
  require f
end

module Vx
  module Builder
    class BuildConfiguration

      ATTRIBUTES = %w{
        rvm
        scala
        jdk
        language

        gemfile
        services
        image

        before_install
        before_script
        script
        after_success
      }

      class << self
        def from_yaml(yaml)
          hash = YAML.load(yaml)
          new hash
        end

        def from_file(file)
          if File.readable? file
            from_yaml File.read(file)
          end
        end
      end

      attr_reader :env, :cache

      def initialize(new_attributes = {}, matrix_attributes = {})
        new_attributes = {} unless new_attributes.is_a?(Hash)

        @env   = Env.new(new_attributes["env"])
        @cache = Cache.new(new_attributes["cache"])
        @matrix_attributes = matrix_attributes

        build_attributes new_attributes
      end

      # for tests
      def matrix_id
        @matrix_attributes.map do |k,v|
          if k == 'env'
            v = v["matrix"].first
          end
          if v
            [k,v].join(":")
          end
        end.compact.sort.join(", ")
      end

      def to_hash
        attributes.merge("env"   => env.attributes)
                  .merge("cache" => cache.attributes)
      end

      def to_yaml
        to_hash.to_yaml
      end

      def env_matrix
        env.matrix
      end

      ATTRIBUTES.each do |attr|
        define_method attr do
          attributes[attr]
        end
      end

      private

        def attributes
          @attributes
        end

        def build_attributes(new_attributes)
          @attributes = ATTRIBUTES.inject({}) do |ac, attribute_name|
            attribute = new_attributes[attribute_name]
            ac[attribute_name] = Array(attribute)
            ac
          end
        end

    end
  end
end
