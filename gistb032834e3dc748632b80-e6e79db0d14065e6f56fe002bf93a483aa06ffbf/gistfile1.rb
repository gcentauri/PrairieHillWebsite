module ComfortableMexicanSofa::ViewMethods
  # Content of a snippet. Examples:
  #   cms_snippet_content_with_locals(:my_snippet, locals_hash)
  #   <%= cms_snippet_content_with_locals(:my_snippet, locals_hash) do %>
  #     Default content can go here.
  #   <% end %>
  def cms_snippet_content_with_locals(identifier, locals={}, cms_site = nil, &block)
    unless cms_site
      host, path = request.host.downcase, request.fullpath if respond_to?(:request) && request
      cms_site ||= (@cms_site || Cms::Site.find_site(host, path))
    end
    return '' unless cms_site

    snippet = cms_site.snippets.find_by_identifier(identifier)

    if !snippet && block_given?
      snippet = cms_site.snippets.create(
        :identifier => identifier,
        :label      => identifier.to_s.titleize,
        :content    => capture(&block)
      )
    end

    return '' unless snippet
    render :inline => ComfortableMexicanSofa::Tag.process_content(cms_site.pages.build, ComfortableMexicanSofa::Tag.sanitize_irb(snippet.content)).gsub("&lt;", "<").gsub("&gt;", ">"), locals: locals
  end
end
