Pod::Spec.new do |s|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "Haptify"
  s.version      = "1.0"
  s.summary      = "A short description of Haptify.podspec."

  # This description is used to generate tags and improve search results.
  s.description  = <<-DESC
  Make your iOS app's user experience better with Haptify. Haptify provides easy APIs to integrate and use Taptic/Haptic and Vibration feedback.
                   DESC

  s.homepage     = "https://github.com/AnandKore91/Haptify"
  s.license      = "GNU GENERAL PUBLIC LICENSE"
  s.author       = "Anand Kore"
  s.platform     = :ios, "10.0"
  s.swift_version = "4.2"
  s.source       = { :git => "https://github.com/AnandKore91/Haptify.git", :tag => "#{s.version}" }
  s.source_files  = "Haptify/Haptify/Haptifier/*", "Haptify/Haptify/Haptifier/**/*.{h,m}"

end
