import 'dart:io';

class SyncRepository {

  SyncRepository();

  Future<InternetAddress> getIp() async {
    List interfaces = await NetworkInterface.list();
    NetworkInterface interface = interfaces.elementAt(0);
    return interface.addresses.elementAt(0);
  }

  Future<String> getBroadcastAddress() async {
    List interfaces = await NetworkInterface.list();
    NetworkInterface interface = interfaces.elementAt(0);
    String address = interface.addresses.elementAt(0).address;
    List<String> digits = address.split('.');
    digits.replaceRange(3, 4, ['255']);
    return digits.join('.');
  }

  Future<RawDatagramSocket> getSocket(int port) async {
    var socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, port);
    socket.broadcastEnabled = true;
    return socket;
  }
}