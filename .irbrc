begin
  require 'irb/completion'
  require 'irb/ext/save-history'
  require 'rubygems'

  def gem_available?(name)
    Gem::Specification.find_by_name(name)
  rescue Gem::LoadError
    false
  rescue
    Gem.available?(name)
  end

  %x{gem install 'wirble' --no-ri --no-rdoc} unless gem_available?('wirble')
  Gem.refresh 
  require 'wirble'

  Wirble::init
  Wirble::colorize
rescue LoadError => err
  warn "Error encountered: #{err}"
end
