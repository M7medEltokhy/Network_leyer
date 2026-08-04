// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpState {

 RequestStatus get resendStatus; int get remainingSeconds; bool get canResend; String? get errorMessage; String? get resendMessage;
/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpStateCopyWith<OtpState> get copyWith => _$OtpStateCopyWithImpl<OtpState>(this as OtpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpState&&(identical(other.resendStatus, resendStatus) || other.resendStatus == resendStatus)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.canResend, canResend) || other.canResend == canResend)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendMessage, resendMessage) || other.resendMessage == resendMessage));
}


@override
int get hashCode => Object.hash(runtimeType,resendStatus,remainingSeconds,canResend,errorMessage,resendMessage);

@override
String toString() {
  return 'OtpState(resendStatus: $resendStatus, remainingSeconds: $remainingSeconds, canResend: $canResend, errorMessage: $errorMessage, resendMessage: $resendMessage)';
}


}

/// @nodoc
abstract mixin class $OtpStateCopyWith<$Res>  {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) _then) = _$OtpStateCopyWithImpl;
@useResult
$Res call({
 RequestStatus resendStatus, int remainingSeconds, bool canResend, String? errorMessage, String? resendMessage
});




}
/// @nodoc
class _$OtpStateCopyWithImpl<$Res>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._self, this._then);

  final OtpState _self;
  final $Res Function(OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resendStatus = null,Object? remainingSeconds = null,Object? canResend = null,Object? errorMessage = freezed,Object? resendMessage = freezed,}) {
  return _then(_self.copyWith(
resendStatus: null == resendStatus ? _self.resendStatus : resendStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendMessage: freezed == resendMessage ? _self.resendMessage : resendMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpState].
extension OtpStatePatterns on OtpState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpState value)  $default,){
final _that = this;
switch (_that) {
case _OtpState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestStatus resendStatus,  int remainingSeconds,  bool canResend,  String? errorMessage,  String? resendMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.resendStatus,_that.remainingSeconds,_that.canResend,_that.errorMessage,_that.resendMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestStatus resendStatus,  int remainingSeconds,  bool canResend,  String? errorMessage,  String? resendMessage)  $default,) {final _that = this;
switch (_that) {
case _OtpState():
return $default(_that.resendStatus,_that.remainingSeconds,_that.canResend,_that.errorMessage,_that.resendMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestStatus resendStatus,  int remainingSeconds,  bool canResend,  String? errorMessage,  String? resendMessage)?  $default,) {final _that = this;
switch (_that) {
case _OtpState() when $default != null:
return $default(_that.resendStatus,_that.remainingSeconds,_that.canResend,_that.errorMessage,_that.resendMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OtpState implements OtpState {
  const _OtpState({this.resendStatus = RequestStatus.initial, this.remainingSeconds = 60, this.canResend = false, this.errorMessage, this.resendMessage});
  

@override@JsonKey() final  RequestStatus resendStatus;
@override@JsonKey() final  int remainingSeconds;
@override@JsonKey() final  bool canResend;
@override final  String? errorMessage;
@override final  String? resendMessage;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpStateCopyWith<_OtpState> get copyWith => __$OtpStateCopyWithImpl<_OtpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpState&&(identical(other.resendStatus, resendStatus) || other.resendStatus == resendStatus)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.canResend, canResend) || other.canResend == canResend)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.resendMessage, resendMessage) || other.resendMessage == resendMessage));
}


@override
int get hashCode => Object.hash(runtimeType,resendStatus,remainingSeconds,canResend,errorMessage,resendMessage);

@override
String toString() {
  return 'OtpState(resendStatus: $resendStatus, remainingSeconds: $remainingSeconds, canResend: $canResend, errorMessage: $errorMessage, resendMessage: $resendMessage)';
}


}

/// @nodoc
abstract mixin class _$OtpStateCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$OtpStateCopyWith(_OtpState value, $Res Function(_OtpState) _then) = __$OtpStateCopyWithImpl;
@override @useResult
$Res call({
 RequestStatus resendStatus, int remainingSeconds, bool canResend, String? errorMessage, String? resendMessage
});




}
/// @nodoc
class __$OtpStateCopyWithImpl<$Res>
    implements _$OtpStateCopyWith<$Res> {
  __$OtpStateCopyWithImpl(this._self, this._then);

  final _OtpState _self;
  final $Res Function(_OtpState) _then;

/// Create a copy of OtpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resendStatus = null,Object? remainingSeconds = null,Object? canResend = null,Object? errorMessage = freezed,Object? resendMessage = freezed,}) {
  return _then(_OtpState(
resendStatus: null == resendStatus ? _self.resendStatus : resendStatus // ignore: cast_nullable_to_non_nullable
as RequestStatus,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,canResend: null == canResend ? _self.canResend : canResend // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,resendMessage: freezed == resendMessage ? _self.resendMessage : resendMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
