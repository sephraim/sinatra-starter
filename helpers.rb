helpers do
  # Render a view
  def render_view(path, options={})
    erb(path.to_sym, options)
  end
  
  # Render a partial
  def render_partial(path, options={})
    parts = path.to_s.split('/')
    filename = parts.pop
    newpath = [parts, "_#{filename}"].join('/')
    erb(path.to_sym, options.merge(:layout => false))
  end
  
  # Escape HTML
  def h(text)
    Rack::Utils.escape_html(text)
  end
end
