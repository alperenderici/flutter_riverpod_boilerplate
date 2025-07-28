import 'package:flutter_riverpod_boilerplate/core/constants/flavor_config.dart';
import 'package:flutter_riverpod_boilerplate/main.dart' as main_app;

void main() async {
  // Initialize flavor configuration for production
  FlavorConfig.initializeForFlavor(Flavor.production);
  
  // Run the main app
  main_app.main();
}
