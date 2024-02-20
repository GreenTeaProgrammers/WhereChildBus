class GoogleMapApiManager {
  static DateTime _lastRequestTime =
      DateTime.now().subtract(Duration(seconds: 50));

  static bool canSendRequest() {
    final currentTime = DateTime.now();
    if (currentTime.difference(_lastRequestTime).inSeconds >= 50) {
      _lastRequestTime = currentTime;
      return true;
    }
    return false;
  }
}
