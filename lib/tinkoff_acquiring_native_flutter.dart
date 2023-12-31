import 'dart:io';

import 'package:flutter/services.dart';

import 'entities/tax.dart';
import 'entities/taxation.dart';
import 'tinkoff_acquiring_native_flutter_platform_interface.dart';
export 'entities/tax.dart';
export 'entities/taxation.dart';

/// An implementation of [TinkoffAcquiringNativeFlutterPlatform] that uses method channels.
class TinkoffAcquiring extends TinkoffAcquiringNativeFlutterPlatform {
  /// The method channel used to interact with the native platform.
  final _tinkoffAcquiringChannel = const MethodChannel('tinkoff_acquiring_native_flutter');

  Future<void> init({
    required String terminalKey,
    required String publicKey,
    bool developerMode = false,
    bool debug = false,
  }) async {
    await _tinkoffAcquiringChannel.invokeMethod('init', {
      "terminalKey": terminalKey,
      "publicKey": publicKey,
      "developerMode": developerMode,
      "debug": debug,
    });
  }

  Future<List> attachCardWithNativeScreen({
    required String customerKey,
    required String email,
  }) async =>
      await _tinkoffAcquiringChannel.invokeMethod(
        'attachCardWithNativeScreen',
        {
          "customerKey": customerKey,
          "email": email,
        },
      );

  Future<List> isTinkoffPayAvailable() async => await _tinkoffAcquiringChannel.invokeMethod('isTinkoffPayAvailable', {});

  Future<List> payWithTinkoffPay({
    required String orderId,
    required String description,
    required int amountKopek,
    required String itemName,
    required int priceKopek,
    required Tax tax,
    required double quantity,
    required String customerEmail,
    required Taxation taxation,
    required String customerKey,
    required String tinkoffPayVersion,
  }) async =>
      await _tinkoffAcquiringChannel.invokeMethod(
        'payWithTinkoffPay',
        {
          "orderId": orderId,
          "description": description,
          "amountKopek": amountKopek,
          "itemName": itemName,
          "priceKopek": priceKopek,
          "tax": Platform.isAndroid ? tax.name : tax.toIos(),
          "quantity": quantity,
          "customerEmail": customerEmail,
          "taxation": Platform.isAndroid ? taxation.name : taxation.name.toLowerCase(),
          "customerKey": customerKey,
          "tinkoffPayVersion": tinkoffPayVersion,
        },
      );

  launchTinkoffApp(String deepLink) => _tinkoffAcquiringChannel.invokeMethod("launchTinkoffApp", {"deepLink": deepLink});

  Future<List> payWithNativeScreen({
    required String orderId,
    required String description,
    required int amountKopek,
    required String itemName,
    required int priceKopek,
    required Tax tax,
    required double quantity,
    required String customerEmail,
    required Taxation taxation,
    required String customerKey,
    required String activeCardId,
    bool recurrentPayment = false,
  }) async =>
      await _tinkoffAcquiringChannel.invokeMethod(
        'payWithNativeScreen',
        {
          "orderId": orderId,
          "description": description,
          "amountKopek": amountKopek,
          "itemName": itemName,
          "priceKopek": priceKopek,
          "tax": Platform.isAndroid ? tax.name : tax.toIos(),
          "quantity": quantity,
          "customerEmail": customerEmail,
          "taxation": Platform.isAndroid ? taxation.name : taxation.name.toLowerCase(),
          "customerKey": customerKey,
          "activeCardId": activeCardId,
          "recurrentPayment": recurrentPayment
        },
      );
}
