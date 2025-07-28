#!/bin/bash

# Script to configure iOS flavors
# This script helps set up iOS build configurations for different flavors

echo "🍎 Configuring iOS Flavors..."

# Check if we're in the right directory
if [ ! -f "ios/Runner.xcodeproj/project.pbxproj" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

echo "📝 iOS Flavor Configuration Instructions:"
echo ""
echo "To complete the iOS flavor setup, you need to manually configure Xcode:"
echo ""
echo "1. Open ios/Runner.xcworkspace in Xcode"
echo ""
echo "2. Select the Runner project in the navigator"
echo ""
echo "3. In the project settings, duplicate the existing build configurations:"
echo "   - Duplicate 'Debug' and rename to 'Debug-Development'"
echo "   - Duplicate 'Debug' and rename to 'Debug-Staging'"
echo "   - Duplicate 'Release' and rename to 'Release-Development'"
echo "   - Duplicate 'Release' and rename to 'Release-Staging'"
echo "   - Duplicate 'Release' and rename to 'Release-Production'"
echo ""
echo "4. For each new configuration, set the Configuration Settings File:"
echo "   - Debug-Development: ios/Flutter/Development.xcconfig"
echo "   - Debug-Staging: ios/Flutter/Staging.xcconfig"
echo "   - Release-Development: ios/Flutter/Development.xcconfig"
echo "   - Release-Staging: ios/Flutter/Staging.xcconfig"
echo "   - Release-Production: ios/Flutter/Production.xcconfig"
echo ""
echo "5. Create new schemes for each flavor:"
echo "   - Product > Scheme > New Scheme"
echo "   - Name: Runner-Development, Runner-Staging, Runner-Production"
echo "   - Set appropriate build configurations for each scheme"
echo ""
echo "6. Update the Podfile to include the new configurations:"
echo "   Add the new configurations to the project configuration mapping"
echo ""
echo "✅ After completing these steps, you'll be able to build different flavors using:"
echo "   flutter build ios --flavor development"
echo "   flutter build ios --flavor staging"
echo "   flutter build ios --flavor production"
echo ""
echo "📱 The xcconfig files have been created in ios/Flutter/ directory"
echo "🔧 Each flavor will have different bundle identifiers and app names"
