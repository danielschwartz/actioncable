require 'rake/testtask'
require 'pathname'
require 'sprockets'
require 'coffee-script'
require 'action_cable'

dir = File.dirname(__FILE__)

task :default => :test

task :package => "assets:compile"
task "package:clean" => "assets:clean"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = Dir.glob("#{dir}/test/**/*_test.rb")
  t.warning = true
  t.verbose = true
  t.ruby_opts = ["--dev"] if defined?(JRUBY_VERSION)
end

namespace :test do
  task :isolated do
    Dir.glob("test/**/*_test.rb").all? do |file|
      sh(Gem.ruby, '-w', '-Ilib:test', file)
    end or raise "Failures"
  end
end

namespace :assets do
  root_path = Pathname.new(dir)
  destination_path = root_path.join("lib/assets/compiled")

  desc "Compile dist/action_cable.js"
  task :compile do
    puts 'Compiling Action Cable assets...'

    precompile_list = %w(action_cable.js)

    environment = Sprockets::Environment.new
    environment.gzip = false
    Pathname.glob(root_path.join("app/assets/*/")) do |subdir|
      environment.append_path subdir
    end

    compile_path = root_path.join("tmp/sprockets")
    compile_path.rmtree if compile_path.exist?
    compile_path.mkpath

    manifest = Sprockets::Manifest.new(environment.index, compile_path)
    manifest.compile(precompile_list)

    destination_path.rmtree if destination_path.exist?
    manifest.assets.each do |path, fingerprint_path|
      destination_path.join(path).dirname.mkpath
      FileUtils.cp(compile_path.join(fingerprint_path), destination_path.join(path))
    end

    puts 'Done'
  end

  task :clean do
    destination_path.rmtree if destination_path.exist?
  end
end
