set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
activate :directory_indexes
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

ignore 'javascripts/mathjax/README.md'
ignore 'javascripts/mathjax/LICENSE'

helpers do
    def link_to_post title
        return link_to(title, '/posts/'+urlify(title) + '.html')
    end

    def urlify string
      string.tr(
        " ", "_"
      ).sub(
        "&", "and"
      ).sub(
        "@", "at"
      ).tr(
        "^A-Za-z0-9_", ""
      ).sub(
        /_{2,}/, "_"
      ).downcase
    end
end

configure :development do
  set :debug_assets, true
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
