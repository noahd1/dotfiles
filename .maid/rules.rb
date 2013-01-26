require 'pathname'

Maid.rules do

  rule 'Remove downloaded disk images' do
    trash(dir('~/Downloads/*.dmg'))
  end

  rule 'Remove downloaded zipped applications' do
    found = dir('~/Downloads/*.zip').select { |path|
      zipfile_contents(path).any? { |c| c.match(/\.app$/) }
    }
    trash(found)
  end

  rule 'Remove older files downloaded during development/testing' do
    dir('~/Downloads/*').each do |path|
      if downloaded_from(path).any? { |u| u.match('http://*.dev') } &&
          1.week.since?(accessed_at(path))
        trash(path)
      end
    end
  end

  rule 'Remove duplicate files that were downloaded more than once' do
    found = dir('~/Downloads/*').select do |path|
      dir, file = Pathname.new(path).split
      file = file.to_s
      if result = file.match(/\s+\(\d\)/)
        original_filename = file.gsub(result[0], "")
        original_file = dir + original_filename
        File.exist?(original_file)
      end
    end
    trash(found)
  end

  rule 'Remove unzipped file if zipped file exists' do
    found = dir('~/Downloads/*').select do |path|
      if result = path.match(/(.*)\.zip$/) || result = path.match(/(.*)\.tar\.gz$/)
        File.exist?(result[1])
      end
    end
    trash(found)
  end

  rule 'Organize remaining files in Downloads directory by year/month' do
    dir("~/Downloads/*").each do |path|
      dirname, filename = Pathname.new(path).split
      file_created_at = created_at(path)
      new_directory = Pathname.new("~/Documents") + file_created_at.year.to_s + file_created_at.month.to_s.rjust(2, "0")
      mkdir new_directory
      move(path, new_directory + filename)
    end
  end

end
