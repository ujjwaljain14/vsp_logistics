

class AppExceptions implements Exception{

  final String _message;
  final String _prefix;

  AppExceptions(this._prefix, this._message);

  @override
  String toString(){
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions{

  InternetException([String? message]) : super(message!, 'No Internet');

}

class RequestTimeOut extends AppExceptions{

  RequestTimeOut([String? message]) : super(message!, 'Request Time out');

}

class BackendException extends AppExceptions{

  BackendException([String? message]) : super(message!,'');

}

class ServerException extends AppExceptions{

  ServerException([String? message]) : super(message!, 'No Internet');

}

class BadRequestException extends AppExceptions{

  BadRequestException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class UnauthorizedRequestException extends AppExceptions{

  UnauthorizedRequestException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class NotFoundException extends AppExceptions{

  NotFoundException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class UnProcessableException extends AppExceptions{

  UnProcessableException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class MethodNotAllowedException extends AppExceptions{

  MethodNotAllowedException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class TooManyRequestsException extends AppExceptions{

  TooManyRequestsException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class FetchDataException extends AppExceptions{

  FetchDataException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class InternalServerException extends AppExceptions{

  InternalServerException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class BadGatewayException extends AppExceptions{

  BadGatewayException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class ServiceUnavailableException extends AppExceptions{

  ServiceUnavailableException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class GatewayTimeoutException extends AppExceptions{

  GatewayTimeoutException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}

class CustomException extends AppExceptions{

  CustomException([String? errorCode, String? error]) : super('Error: $errorCode', error ?? ' ');

}