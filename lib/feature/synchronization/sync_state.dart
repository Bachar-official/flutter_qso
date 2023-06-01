import 'package:flutter/material.dart';
import 'dart:io';

@immutable
class SyncState {
  final String destinationAddress;
  final RawDatagramSocket? socket;
  final int port = 1337;

  const SyncState({required this.destinationAddress, required this.socket});

  const SyncState.initial()
      : destinationAddress = '',
        socket = null;
}
