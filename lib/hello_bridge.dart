import 'dart:ffi' as ffi; // For FFI
import 'dart:ffi';
import 'dart:io'; // For Platform.isX
import 'package:ffi/ffi.dart';

typedef HelloWorldFunc = ffi.Pointer<Utf8> Function();
typedef AddFunc = ffi.Int32 Function(Int32, Int32);
typedef AddDart = int Function(int, int);

class HelloBridge {
  late HelloWorldFunc _hello;
  late AddDart _add;

  HelloBridge() {
    final dl = Platform.isAndroid
        ? ffi.DynamicLibrary.open('libhello.so')
        : ffi.DynamicLibrary.process();

    _hello = dl
        .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
        .asFunction();

    _add = dl.lookup<ffi.NativeFunction<AddFunc>>('add').asFunction();
  }

  String getHello() => _hello().toDartString();
  int getSum(int a, int b) => _add(a, b);
}
