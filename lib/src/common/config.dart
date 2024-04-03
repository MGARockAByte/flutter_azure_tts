import 'package:flutter_azure_tts/src/common/endpoint_type.dart';
import 'package:flutter_azure_tts/src/auth/auth_token.dart';

///Holds all configurations
class Config {
  static AuthToken? authToken;

  Config._();
  static final Config _instance = Config._();

  factory Config() {
    return _instance;
  }

  ///Subscription key for the endpoint/region you plan to use
  late String subscriptionKey;

  ///Region identifier i.e. [centralus]
  late String region;

  ///Custom URLs for the endpoints
  late Map<EndpointType, String> customEndpoints;

  ///Initialise the config by setting endpoint region and subscription key
  void init({
    required String endpointRegion,
    required String endpointSubKey,
    Map<EndpointType, String>? customEndpointsMap,
  }) {
    region = endpointRegion;
    subscriptionKey = endpointSubKey;
    customEndpoints = customEndpointsMap ?? {};
  }
}
