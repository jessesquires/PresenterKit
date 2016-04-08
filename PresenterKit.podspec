Pod::Spec.new do |s|
   s.name = 'PresenterKit'
   s.version = '1.0.0'
   s.license = 'MIT'

   s.summary = 'Swifty view controller presenters for iOS'
   s.homepage = 'https://github.com/jessesquires/PresenterKit'
   s.documentation_url = 'http://jessesquires.com/PresenterKit'
   s.social_media_url = 'https://twitter.com/jesse_squires'
   s.author = 'Jesse Squires'

   s.source = { :git => 'https://github.com/jessesquires/PresenterKit.git', :tag => s.version }
   s.source_files = 'Source/*.swift'

   s.ios.deployment_target = '8.0'

   s.requires_arc = true
end
