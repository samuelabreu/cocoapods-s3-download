require 'aws-sdk-s3'

module Pod
  module Downloader

    class URLNotFileFromAWSS3 < StandardError; end

    class S3 < Http

      def download_file(full_filename)
        UI.puts("Generating an AWS S3 pre signed URL from: #{url}")

        original_url = url
        begin
          @url = presign_url(original_url)
        rescue URLNotFileFromAWSS3
          UI.puts("#{url} not a S3 URL (https://{BUCKET}.s3.amazonaws.com/FileKey)")
          raise
        rescue Aws::Errors::MissingRegionError
          UI.puts("No AWS region was provided. Export a region on ENV['AWS_REGION'] or setup properly using https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#aws-ruby-sdk-credentials-shared")
          raise
        rescue Aws::Sigv4::Errors::MissingCredentialsError
          UI.puts("No AWS credentials was provided. Export on ENV['AWS_ACCESS_KEY'] and ENV['AWS_SECRET_KEY'] or setup properly using https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#aws-ruby-sdk-credentials-shared")
          raise
        end
        super(full_filename)
      end

      def presign_url(original_url)
        final_url = original_url
        bucket = nil
        key = nil
        begin
          uri = URI.parse(original_url)
          bucket = uri.host
          if bucket.slice!(".s3.amazonaws.com").nil?
            raise URLNotFileFromAWSS3
          end
          key = uri.path[1..-1]
        rescue StandardError
          raise URLNotFileFromAWSS3
        end

        if key.nil? || key.empty?
          raise URLNotFileFromAWSS3
        end
        presigner = Aws::S3::Presigner.new
        final_url, _ = presigner.presigned_request(
          :get_object, bucket: bucket, key: key
        )
        UI.puts final_url
        final_url
      end

    end
  end
end
