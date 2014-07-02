module Vx
  module Builder
    class ScriptBuilder

      class Ruby < Base

        DEFAULT_RUBY = '1.9.3'

        def call(env)
          if enabled?(env)

            vxvm_install(env, 'ruby', ruby_version(env))

            do_cache_key(env) do |i|
              i << "rvm-#{ruby_version env}"
              i << gemfile(env)
            end

            do_before_install(env) do |i|
              i << trace_sh_command("export BUNDLE_GEMFILE=${PWD}/#{gemfile(env)}")
              i << trace_sh_command('export GEM_HOME=~/.rubygems')
            end

            do_announce(env) do |i|
              i << trace_sh_command("ruby --version")
              i << trace_sh_command("gem --version")
              i << trace_sh_command("bundle --version")
            end

            do_install(env) do |i|
              bundler_args = env.source.bundler_args.first
              i << trace_sh_command("bundle install #{bundler_args}")
              i << trace_sh_command("bundle clean --force")
            end

            do_script(env) do |i|
              script = "if [ -f Rakefile ] ; then \n #{trace_sh_command "bundle exec rake"}\nfi"
              i << script
            end

            do_cached_directories(env) do |i|
              i << "~/.rubygems"
            end
          end

          app.call(env)
        end

        private

          def enabled?(env)
            env.source.rvm.first || env.source.language == 'ruby'
          end

          def ruby_version(env)
            env.source.rvm.first || DEFAULT_RUBY
          end

          def gemfile(env)
            env.source.gemfile.first || "Gemfile"
          end

      end
    end
  end
end
