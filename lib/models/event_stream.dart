
import 'base_model.dart';

//@JsonSerializable(nullable: false)
//@StreamConverter()
class EventStream extends BaseModel {
  final String event;

  EventStream({ this.event });
  
  @override
  List<Object> get props => [event];
  
  // factory EventStream.fromJson(Map<String, dynamic> json) => _$EventStreamFromJson(json);
  
  // Map<String, dynamic> toJson() => _$EventStreamToJson(this);
}