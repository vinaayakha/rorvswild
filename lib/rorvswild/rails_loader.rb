module RorVsWild
  class RailsLoader
    def self.start_on_rails_initialization
      return if !defined?(Rails)
      Rails::Railtie.initializer "rorvswild.detect_config_file" do
        RorVsWild::RailsLoader.start
      end
    end

    def self.start
      return if RorVsWild.agent

      if (config = load_config) && config[:api_key]
        RorVsWild.start(config)
      elsif Rails.env.development?
        require "rorvswild/local"
        RorVsWild::Local.start(config || {})
      end
    end

    def self.load_config
      if (path = Rails.root.join("config/rorvswild.yml")).exist?
        hash = YAML.load(ERB.new(path.read).result)[Rails.env]
        hash && hash.deep_symbolize_keys
      end
    end
  end
end
