import 'dart:async';
import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum ApiState {
  loaded,
  pending,
  error;

  bool get isPending => this == ApiState.pending;

  bool get isLoaded => this == ApiState.loaded;

  bool get isError => this == ApiState.error;

  bool get isNotPending => this != ApiState.pending;

  bool get isNotLoaded => this != ApiState.loaded;

  bool get isNotError => this != ApiState.error;
}

typedef Err = Object?;

class ApiError implements Exception {
  const ApiError(this.value);

  final Err value;

  @override
  String toString() {
    return value.toString();
  }
}

typedef FutureE<T> = Future<Either<ApiError, T>>;

class RxV<T> {
  RxV(T initial, {ApiState state = ApiState.loaded})
      : _data = initial.obs,
        _state = state.obs,
        _error = Rx(null);

  final Rx<ApiState> _state;
  final Rx<Err> _error;
  final Rx<T> _data;

  ApiState get state => _state.value;

  T get data => _data.value;

  Err get error => _error.value;

  bool get isPending => state.isPending;

  bool get isLoaded => state.isLoaded;

  bool get isError => state.isError;

  bool get isNotPending => state.isNotPending;

  bool get isNotLoaded => state.isNotLoaded;

  bool get isNotError => state.isNotError;

  void setPending() => _state.value = ApiState.pending;

  set data(T data) {
    _data.value = data;
    _state.value = ApiState.loaded;
    _error.value = null;
  }

  set error(Err error) {
    _state.value = ApiState.error;
    _error.value = error;
  }

  set fromApi(Either<ApiError, T> resp) {
    resp.isLeft ? error = resp.left.value : data = resp.right;
  }

  StreamSubscription listenError(Function(Err err) callback) {
    return _error.listen((_) {
      if (isError) {
        callback(error);
      }
    });
  }

  StreamSubscription listenData(Function(T data) callback) {
    return _data.listen((_) {
      callback(data);
    });
  }
}

/// Catches Exceptions and returns either an error or data
FutureE<T> safe<T>(FutureOr<T> Function() future) async {
  try {
    return Right(await future());
  } on ApiError catch (e) {
    print(e.value);
    return Left(e);
  } on Exception catch (e) {
    print(e);
    return Left(ApiError(e));
  }
}

/// [safe] for mock functions with 70% probability of success
FutureE<T> safeMock<T>(
  T value, {
  Duration delay = const Duration(milliseconds: 500),
}) async {
  final success = Random().nextDouble() < 0.7;
  return safe<T>(
    () => success
        ? Future.delayed(delay, () => value)
        : Future.error(Exception('Some mock error')),
  );
}
