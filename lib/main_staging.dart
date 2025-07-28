import 'package:flutter_riverpod_boilerplate/core/constants/flavor_config.dart';
import 'package:flutter_riverpod_boilerplate/main.dart' as main_app;

void main() async {
  // Initialize flavor configuration for staging
  FlavorConfig.initializeForFlavor(Flavor.staging);
  
  // Run the main app
  main_app.main();
}
