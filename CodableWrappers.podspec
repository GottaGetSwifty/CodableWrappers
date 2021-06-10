Pod::Spec.new do |s|
  s.name             = 'CodableWrappers'
  s.version          = '2.0.6'
  s.swift_versions   = ['5.2']
  s.summary          = 'Simplified Serialization with Property Wrappers'
  s.description      = <<-DESC
  Simplified Serialization with Property Wrappers
   * @EncodeNulls
   * Lossy Collections
   * Empty Defaults
   * Other Fallbacks
   * @OmitCoding
   * @Base64Coding
   * @SecondsSince1970DateCoding
   * @MillisecondsSince1970DateCoding
   * @DateFormatterCoding<DateFormatterStaticCoder>
   * @ISO8601DateCoding
   * @ISO8601DateFormatterCoding<ISO8601DateFormatterStaticCoder>
   * @NonConformingFloatCoding<ValueProvider>
   * @NonConformingDoubleCoding<ValueProvider>
   * Bool Coding
   * Additional Customization
   * Property Mutability
   * Only Encoding or Decoding
   * Property Mutability
   * Optional
   * Only Encoding or Decoding
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

	
	

end
