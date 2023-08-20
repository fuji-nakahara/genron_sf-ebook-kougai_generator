# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "genron_sf-ebook-kougai_generator"
  spec.version = "0.1.0"
  spec.authors = ["Fuji Nakahara"]
  spec.email = ["fujinakahara2032@gmail.com"]

  spec.summary = "ゲンロン 大森望 SF創作講座の梗概の著者名を消してランダムに並び替えた EPUB を生成する Ruby gem"
  spec.homepage = "https://github.com/fuji-nakahara/genron_sf-ebook-kougai_generator"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fuji-nakahara/genron_sf-ebook-kougai_generator"

  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "genron_sf", "~> 0.2.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
