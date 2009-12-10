if File.exist?("#{RAILS_ROOT}/config/s3.yml")
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_credentials] = "#{RAILS_ROOT}/config/s3.yml"
  Paperclip::Attachment.default_options[:bucket] = S3_BUCKET
end
