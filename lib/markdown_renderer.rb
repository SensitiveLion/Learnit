require "rouge/plugins/redcarpet"

class Markdown
  def self.render(content)
    renderer.render(content)
  end

  private

  def self.renderer
    Redcarpet::Markdown.new(HighlightingRenderer,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true)
  end

  class HighlightingRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end
end
