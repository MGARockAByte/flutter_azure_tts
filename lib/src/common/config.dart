import 'package:flutter_azure_tts/src/auth/auth_token.dart';
import 'package:flutter_azure_tts/src/common/constants.dart';

///Holds all configurations
class Config {
  static AuthToken? authToken;

  Config._();

  ///Subscription key for the endpoint/region you plan to use
  static late final String subscriptionKey;

  ///Region identifier i.e. [centralus]
  static late final String region;

  ///Custom URLs for the endpoints
  static late final Map<EndpointType, String> customEndpoints;

  ///Initialise the config by setting endpoint region and subscription key
  static void init({
    required String endpointRegion,
    required String endpointSubKey,
    Map<EndpointType, String>? customEndpoints,
  }) {
    region = endpointRegion;
    subscriptionKey = endpointSubKey;
    customEndpoints = customEndpoints ?? {};
  }
}
