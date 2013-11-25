require 'pathname'

Maid.rules do

  ["~/Downloads", "~/Desktop"].each do |junk_drawer|
    rule 'Remove downloaded disk images' do
      trash(dir("#{junk_drawer}/*.dmg"))
    end

    rule 'Remove downloaded zipped applications' do
      found = dir("#{junk_drawer}/*.zip").select { |path|
        zipfile_contents(path).any? { |c| c.match(/\.app$/) }
      }
      trash(found)
    end

    rule 'Remove older files downloaded during development/testing' do
      dir("#{junk_drawer}/*").each do |path|
        if downloaded_from(path).any? { |u| u.match('http://*.dev') } &&
            1.week.since?(accessed_at(path))
          trash(path)
        end
      end
    end

    rule 'Remove duplicate files that were downloaded more than once' do
      found = dir("#{junk_drawer}/*").select do |path|
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
      found = dir("#{junk_drawer}/*").select do |path|
        if result = path.match(/(.*)\.zip$/) || result = path.match(/(.*)\.tar\.gz$/)
          File.exist?(result[1])
        end
      end
      trash(found)
    end

    rule 'Archive remaining downloaded files in Archive with directory by year/month' do
      dir("#{junk_drawer}/*").each do |path|
        dirname, filename = Pathname.new(path).split
        file_created_at = created_at(path)
        new_directory = Pathname.new("~/Archive") + file_created_at.year.to_s + file_created_at.month.to_s.rjust(2, "0")
        mkdir new_directory
        move(path, new_directory)
      end
    end
  end
end
