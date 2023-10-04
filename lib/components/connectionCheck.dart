import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:quickalert/quickalert.dart';

void checkRealtimeConnection(context) {
  Connectivity().onConnectivityChanged.listen((event) {
    if (event == ConnectivityResult.none) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        text: 'No Internet Connection',
      );
    }
  });
}

Future<void> connectivityCheck(context) async {
  if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
    if (context.mounted) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        text: 'No Internet Connection',
      );
    }
  }
}
