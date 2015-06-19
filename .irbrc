require 'irb/completion'
require 'irb/ext/save-history'
require 'rubygems'
begin
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

IRB.conf[:PROMPT][:MY_PROMPT] = {
  :AUTO_INDENT => true,
  :PROMPT_I => ">> ",
  :PROMPT_N => ".. ",
  :PROMPT_S => "%l>> ",
  :PROMPT_C => ".. ",
  :RETURN => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :MY_PROMPT
