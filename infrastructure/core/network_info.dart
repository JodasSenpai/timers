import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/core/inject/injection_container.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

//todo improve network detection in web
//https://github.com/RounakTadvi/internet_connection_checker/issues/15
@disableOnWeb
@LazySingleton(as: INetworkInfo)
class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker connectionChecker;

  const NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

@web
@LazySingleton(as: INetworkInfo)
class NetworkInfoWebImpl implements INetworkInfo {
  //temporary fix until ICC is fixed
  const NetworkInfoWebImpl();

  @override
  Future<bool> get isConnected => _hasNetwork();

  Future<bool> _hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.none ? false : true;
  }
}
