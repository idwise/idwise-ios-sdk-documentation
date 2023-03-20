Pod::Spec.new do |spec|
  spec.name                   = 'ExampleModule'
  spec.version                = '1.0.0'
  spec.summary                = 'Example module for Demo'
  
  spec.homepage               = 'https://github.com/idwise'
  spec.author                 = { 'IDWise' => 'support@idwise.com' }
  spec.source                 = { :git => 'git@github.com:idwise', :tag => spec.version.to_s }

  spec.ios.deployment_target  = '13.0'
  spec.static_framework       = true
  spec.swift_version          = '5.0'

  spec.source_files           = 'Sources/**/*.{swift}'
  spec.resource_bundle        = {
    'ExampleModule' => [
    'Sources/**/*.{xcassets,strings,xib,storyboard,gif,json}'
    ]
  }

  spec.dependency              'IDWise'
  
  spec.xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '$(inherited) "${PODS_CONFIGURATION_BUILD_DIR}/ExampleModule/ExampleModule.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/GTMSessionFetcher/GTMSessionFetcher.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/GoogleDataTransport/GoogleDataTransport.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/GoogleToolboxForMac/GoogleToolboxForMac.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/GoogleUtilities/GoogleUtilities.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/GoogleUtilitiesComponents/GoogleUtilitiesComponents.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/PromisesObjC/FBLPromises.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/Protobuf/Protobuf.framework/Headers" "${PODS_CONFIGURATION_BUILD_DIR}/nanopb/nanopb.framework/Headers" "${PODS_ROOT}/Headers/Public" "${PODS_ROOT}/Headers/Public/GoogleMLKit" $(inherited) ${PODS_ROOT}/GoogleMLKit/MLKitCore/Sources' }
end
