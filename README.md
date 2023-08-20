# GenronSF::EBook::KougaiGenerator

ゲンロン 大森望 SF創作講座の梗概の著者名を消してランダムに並び替えた EPUB を生成する Ruby gem

## Installation

```shell
$ git clone https://github.com/fuji-nakahara/genron_sf-ebook-kougai_generator.git
$ cd genron_sf-ebook-kougai_generator
$ bin/setup
$ bundle exec rake install
```

## Usage

    $ genron_sf_kougai

すると、カレントディレクトリに EPUB が生成されます。

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fuji-nakahara/genron_sf-ebook-kougai_generator.
