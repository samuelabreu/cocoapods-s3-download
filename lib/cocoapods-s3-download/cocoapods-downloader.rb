require 'cocoapods-s3-download/s3'

module Pod
  module Downloader
    class <<self
      alias_method :real_downloader_class_by_key, :downloader_class_by_key
    end

    def self.downloader_class_by_key
      original = self.real_downloader_class_by_key
      original[:s3] = S3
      original
    end

  end
end

