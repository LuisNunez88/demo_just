import 'package:flutter/material.dart';

import '../../../../domain/entities/either.dart';
import '../../../../domain/failures/failure.dart';
import 'http_client.dart';

Either<Failure, R> resultHandler<R>(HttpResponse response,
    {Function(R)? onSuccess, VoidCallback? onError}) {
  if (response.data != null) {
    if (onSuccess != null) {
      onSuccess(response.data);
    }
    return Either.right(response.data!);
  } else {
    final failure = () {
      final statusCode = response.error?.statusCode;
      final msg = response.error?.message;
      switch (statusCode) {
        case 404:
          return Failure.notFound(msg);
        case 401:
          return Failure.unauthorized(msg);
      }
      if (response.error?.type != 'unknown') {
        return Failure.network(msg);
      }
      return Failure.unknown(msg);
    }();
    if (onError != null) {
      onError();
    }
    return Either.left(failure);
  }
}
