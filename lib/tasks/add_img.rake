namespace :add_img do
  desc "TODO"
  task add_to_callout: :environment do
    callouts = Callout.all
    uploader = ImageUploader.new
    image_path = Rails.root.join("app", "assets", "images", "media.png")
    file_in = File.open(image_path)
    
    callouts.each do |c|
      if c.is_callout?
        unless c.image.url
          c.image = file_in
          c.save!
          
        end
      end
    end
  end

  desc "TODO"
  task add_to_suggest: :environment do
    suggests = Callout.all
    uploader = ImageUploader.new
    image_path = Rails.root.join("app", "assets", "images", "source.png")
    file_in = File.open(image_path)
    

    suggests.each do |s|
      if s.is_suggestion?
        unless s.image.url
          s.image = file_in
          s.save!
          
        end
      end
    end
  end

end
