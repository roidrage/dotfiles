desc "Link all files and directories into the home directory"
task :link do
  %w{zshrc zshaliases zshfunctions zsh screenrc}.each do |dot|
    FileUtils.ln_sf File.dirname(__FILE__) + "/#{dot}", "#{ENV["HOME"]}/.#{dot}"
  end
end
