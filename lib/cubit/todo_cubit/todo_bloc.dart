import 'package:flutter_bloc/flutter_bloc.dart';

// (lớp trừu tượng) đại diện cho các sự kiện (event) mà bạn có thể gửi đến TodoBloc.
//thông báo cho boc biết cần thực hiện hành động gìgì
abstract class TodoEvent {}

// các sự kiện của todoEven
// Sự kiện thêm công việc
// Sự kiện này sẽ được gọi khi người dùng muốn thêm một công việc mới vào danh sách công việc
class AddTodo extends TodoEvent {
  final String todo; // công việc thêm dưới dạng string
  AddTodo(this.todo); // Cosntructor nhận giá trị todo
}

// Sự kiện xóa công việc
// Sự kiện này sẽ được gọi khi người dùng muốn xóa một công việc khỏi danh sách công việc
class RemoveTodo extends TodoEvent {
  final int index; // index chỉ vị trí cần xóa trong danh sách
  RemoveTodo(this.index); //Constructor nhận giá trị index
}

//Đây là abstract class đại diện cho trạng thái (state) của ứng dụng.
//Bloc sẽ phát (emit) các trạng thái này để giao diện (UI) có thể cập nhật
abstract class TodoState {}

// Trạng thái khởi tạo
// Trạng thái này được sử dụng khi ứng dụng vừa mới bắt đầu và chưa có công việc nào trong danh sách
class TodoInitial extends TodoState {}

// Trạng thái đã tải
// Trạng thái này được sử dụng khi danh sách công việc đã được tải thành công và có ít nhất một công việc trong danh sách
class TodoLoaded extends TodoState {
  final List<String> todos; // danh sách công việc
  TodoLoaded(this.todos); // constructor nhận danh sách công việc
}

//quản lý logic của ứng dụng Todo
//TodoBloc kế thừa từ Bloc<TodoEvent, TodoState>, nghĩa là nó nhận các sự kiện (TodoEvent) và phát ra các trạng thái (TodoState).
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> _list = []; //khởi tạo danh sách công việc priviteprivite

  // Constructor của TodoBloc,
  // super(TodoInitial()) khởi tạo trạng thái ban đầu là TodoInitial
  TodoBloc() : super(TodoInitial()) {
    // Khi nhận được sự kiện AddTodo, nó sẽ thêm công việc vào danh sách và phát ra trạng thái TodoLoaded với danh sách mới.
    on<AddTodo>((event, emit) {
      _list.add(event.todo); // add vào danh sách
      emit(TodoLoaded(List.from(_list))); //load lại danh sách mới sau thêmthêm
    });
    // Khi nhận được sự kiện RemoveTodo, nó sẽ xóa công việc khỏi danh sách và phát ra trạng thái TodoLoaded với danh sách mới.
    on<RemoveTodo>((event, emit) {
      _list.removeAt(event.index); // xóa tại vị trí index
      emit(TodoLoaded(List.from(_list))); // load lại danh sách mới sau xóaxóa
    });
  }
}
