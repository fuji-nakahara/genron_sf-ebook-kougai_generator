# frozen_string_literal: true

require "genron_sf/ebook"

require_relative "kougai_generator/version"

module GenronSF
  module EBook
    class KougaiGenerator < Generator
      attr_reader :subject

      def initialize(subject)
        @subject = subject
        super()
      end

      def generate
        book.identifier = "#{subject.url}#summary"
        book.language = "ja"
        book.title = "#{subject.theme}（梗概）"
        book.creator = "ゲンロン 大森望 SF創作講座"
        book.contributor = subject.lecturers.find { |lecturer| lecturer.roles.include?("課題提示") }

        File.open(TemplateUtil::CSS_FILE_PATH) do |file|
          book.add_item(File.basename(file.path), content: file)
        end

        book.ordered do
          entries = subject.entries.shuffle
          entries.each do |work|
            book.add_item(
              "#{work.student.id}-title.xhtml",
              content: StringIO.new(TemplateUtil.title_xhtml(work.summary_title)),
              toc_text: work.summary_title
            )
            book.add_item(
              "#{work.student.id}-summary.xhtml",
              content: StringIO.new(kougai_xhtml(work))
            )
          end
        end

        book.generate_epub("SF創作講座#{subject.year}-#{subject.number.to_s.rjust(2, "0")}-梗概.epub")
      end

      private

      def kougai_xhtml(work)
        template ||= File.read(File.expand_path("kougai.xhtml.erb", __dir__))
        ERB.new(template).result_with_hash(work:)
      end
    end
  end
end
