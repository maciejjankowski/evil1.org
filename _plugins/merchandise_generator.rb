module Jekyll
  class MerchandisePageGenerator < Generator
    safe true
    priority :high

    def generate(site)
      return unless site.data['merchandise']

      site.data['merchandise'].each do |key, product|
        # Skip if product doesn't have required fields
        next unless product['title'] && product['permalink']

        # Create a new page for this product
        page = MerchandisePage.new(site, site.source, product['permalink'], product, key)
        site.pages << page
      end
    end
  end

  class MerchandisePage < Page
    def initialize(site, base, dir, product, sku)
      @site = site
      @base = base
      @dir = dir.sub(/^\//, '').sub(/\/$/, '') # Remove leading and trailing slashes
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'merchandise-product.html')

      # Set page data
      data['title'] = product['title']
      data['description'] = product['description']
      data['sku'] = sku
      data['product'] = product
      data['permalink'] = product['permalink']
      data['layout'] = 'merchandise-product'
    end
  end
end