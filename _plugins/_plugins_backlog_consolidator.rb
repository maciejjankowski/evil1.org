# Jekyll plugin to consolidate individual backlog fragments into a single _docs/backlog-all.md
# Place this file in your site's _plugins/ directory. It runs on every `jekyll build`.

module Jekyll
  class BacklogConsolidator < Generator
    safe true
    priority :low

    def generate(site)
      docs_dir = File.join(site.source, "_docs")
      pattern  = File.join(docs_dir, "backlog-*.md")
      files    = Dir[pattern].sort

      return if files.empty?

      consolidated = files.map do |path|
        # Read each fragment, strip YAML front matter if present, and join
        content = File.read(path)
        content.sub(/\A---(.|\n)*?---\s*/, "")
      end.join("\n\n---\n\n")

      out_path = File.join(docs_dir, "backlog-all.md")
      File.write(out_path, consolidated)

      # Make sure Jekyll picks it up
      site.static_files << Jekyll::StaticFile.new(site, site.source, "_docs", "backlog-all.md")
    end
  end
end