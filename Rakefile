desc "Link all files and directories into the home directory"
task :link do
  %w{zshrc zshaliases zshfunctions zsh}.each do |dot|
    FileUtils.ln_s File.dirname(__FILE__) + "/#{dot}", "#{ENV["HOME"]}/.#{dot}"
  end
end
