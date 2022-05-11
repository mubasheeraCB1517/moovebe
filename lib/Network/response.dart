class Responses<T> {
  late Status status;
  late T data;
  late String message;

  Responses.loading(this.message) : status = Status.LOADING;
  Responses.completed(this.data) : status = Status.COMPLETED;
  Responses.error(this.message) : status = Status.ERROR;
  Responses.success(this.data) : status = Status.SUCCESS;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR,SUCCESS }