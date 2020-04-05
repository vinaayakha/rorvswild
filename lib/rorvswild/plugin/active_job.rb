module RorVsWild
  module Plugin
    class ActiveJob
      def self.setup
        return if @installed
        return unless defined?(::ActiveJob::Base)
        ::ActiveJob::Base.around_perform(&method(:around_perform))
        @installed = true
      end

      def self.around_perform(job, block)
        RorVsWild.agent.measure_job(job.class.name, parameters: job.arguments) do
          section = RorVsWild::Section.start
          section.command = "#{job.class}#perform"
          section.file, section.line = job.method(:perform).source_location
          section.file = RorVsWild.agent.locator.relative_path(section.file)
          block.call
        ensure
          RorVsWild::Section.stop
        end
      end
    end
  end
end
