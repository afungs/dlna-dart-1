import 'dart:async';
import '../lib/dlna.dart';

main(List<String> args) async {
  final m = await search().start();
  Timer.periodic(Duration(seconds: 10), (timer) {
    m.deviceList.forEach((key, value) async {
      print(key);
      if (value.info.friendlyName.contains('Wireless')) return;
      print(value.info.friendlyName);
      final text = await value.position();
      final r = await value.seekByCurrent(text, 10);
      print(r);
    });
  });
}
