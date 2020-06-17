require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Downloader::S3 do
    before do
      ENV['AWS_REGION'] = 'us-east-1'
      ENV['AWS_ACCESS_KEY'] = 'AAAAAAAAAAAAAAA'
      ENV['AWS_SECRET_KEY'] = 'AAAAAAAAAAAAAAA'
    end

    it 'should convert url to presigned' do
      url = 'https://testbuckettmp.s3.amazonaws.com/randomfile.zip'
      s3 = Downloader::S3.new('target_path', url, {})
      s3.url.should.equal url
      s3.download_file('/tmp/fullfilename.zip')
      s3.url.should.match(/X-Amz-Algorithm=AWS4-HMAC-SHA256/)
      s3.url.should.match(/X-Amz-Credential=AAAAAAAAAAAAAAA%2F20200617%2Fus-east-1%2Fs3%2Faws4_request/)
      s3.url.should.match(/X-Amz-Date=/)
      s3.url.should.match(/X-Amz-Expires=/)
      s3.url.should.match(/X-Amz-SignedHeaders=/)
      s3.url.should.match(/X-Amz-Signature=/)
    end

    it 'should raise URLNotFileFromAWSS3 when not on s3 domain' do
      url = 'https://notas3url/file.zip'
      s3 = Downloader::S3.new('target_path', url, {})
      s3.url.should.equal url
      should.raise(Downloader::URLNotFileFromAWSS3) { s3.download_file('/tmp/fullfilename.zip') }
    end

    it 'should raise URLNotFileFromAWSS3 when without file' do
      url = 'https://testbuckettmp.s3.amazonaws.com/'
      s3 = Downloader::S3.new('target_path', url, {})
      s3.url.should.equal url
      should.raise(Downloader::URLNotFileFromAWSS3) { s3.download_file('/tmp/fullfilename.zip') }
    end

  end
end
