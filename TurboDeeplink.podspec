# Require the json package to read package.json
require "json"
# Read package.json to get some metadata about our package
package = JSON.parse(File.read(File.join(__dir__, "./package.json")))
# Define the configuration of the package
Pod::Spec.new do |s|
  # Name and version are taken directly from the package.json
  s.name            = package["name"]
  s.version         = package["version"]
  s.description     = package["description"]
  s.homepage        = package["repository"]["url"].gsub(/\.git$/, "")
  s.summary         = "React Native TurboModule for handling deep links"
  s.license         = package["license"]
  s.platforms       = { :ios => min_ios_version_supported }
  s.author          = package["author"]
  s.source          = { :git => package["repository"]["url"], :tag => "v#{s.version}" }
  # Define the source files extension that we want to recognize
  s.source_files    = "ios/*.{h,m,mm}"
  s.dependency "React-Core"
  
  # This part installs all required dependencies like Fabric, React-Core, etc.
  install_modules_dependencies(s)
end