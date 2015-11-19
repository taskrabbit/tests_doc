namespace :tests_doc do
  namespace :index do
    task :build_if_changed, :root_folder do |t, args|
      require 'fileutils'
      require 'tests_doc'

      root_folder = args[:root_folder] || TestsDoc.configuration.root_folder

      changed_files = Rake::FileList.new(File.join(root_folder, "api/**/*.md")) do |file_list|
        file_list.exclude { |f|
          `git diff #{f}`.empty? && `git ls-files #{f}`.present?
        }
      end

      Rake::Task["tests_doc:index:build"].invoke(root_folder) if changed_files.any?
    end

    task :build, :root_folder do |t, args|
      require 'fileutils'
      require 'tests_doc'

      root_folder = args[:root_folder] || TestsDoc.configuration.root_folder

      puts "\nbuilding README.md\n"

      endpoints = {}

      Rake::FileList[File.join(root_folder, "api/**/*.md")].each do |file|
        path = File.open(file, &:readline)
        endpoints[path] ||= []
        endpoints[path] << file.gsub(root_folder.to_s, "")
      end

      TestsDoc::Index.new(endpoints).write
    end
  end
end
