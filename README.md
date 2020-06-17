# cocoapods-s3-download

Enable cocoapods to download files from S3 using [pre-signed URLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/ShareObjectPreSignedURL.html) to distribute private frameworks using AWS IAM Credentials

Use podspecs with 's3' type on source. Example:

```
s.source = { :s3 => "https://{BUCKET}.s3.amazonaws.com/File.framework.zip"  }
```


To be able to download from a S3 URL a IAM credential is needed, more info about how to setup IAM credentials:

<https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#aws-ruby-sdk-credentials-shared>


## Build

```sh
git clone git://github.com/samuelabreu/cocoapods-s3-download
cd cocoapods-s3-download
gem build cocoapods-s3-download.gemspec
gem install cocoapods-s3-download-x.x.x.gem
```

## Installation

Using bundler:

```
gem 'cocoapods-s3-download', :git => 'git://github.com/samuelabreu/cocoapods-s3-download.git'
```
