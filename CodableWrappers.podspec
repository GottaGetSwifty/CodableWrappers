Pod::Spec.new do |s|
  s.name             = 'CodableWrappers'
  s.version          = '2.0.7'
  s.swift_versions   = ['5.2']
  s.summary          = 'Simplified Serialization with Property Wrappers'
  s.description      = <<-DESC
  Simplified Serialization with Property Wrappers and Macros
  ```
@CustomCodable @SnakeCase
struct User: Codable {
    let firstName: String
    let lastName: String
    @SecondsSince1970DateCoding
    var joinDate: Date
    @CustomCodingKey("data")
    var imageData: Data
}
```
                       DESC

  s.homepage         = 'https://github.com/GottaGetSwifty/CodableWrappers'
  s.license          = { :type => 'APACHE', :file => 'LICENSE' }
  s.author           = { 'GottaGetSwifty' => 'https://github.com/GottaGetSwifty' }
  s.source           = { :git => 'https://github.com/GottaGetSwifty/CodableWrappers.git', :tag => s.version.to_s }
  s.source_files  = 'Sources/**/*'
  s.frameworks  = 'Foundation'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.compiler_flags = "-Xfrontend -enable-experimental-macro-features"
	
	

end
