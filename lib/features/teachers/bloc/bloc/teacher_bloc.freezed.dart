// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeacherState {
  BlocStatus get statusGetTeacher => throw _privateConstructorUsedError;
  BlocStatus get statusTeachersStudents => throw _privateConstructorUsedError;
  BlocStatus get statusNewTeachersStudents =>
      throw _privateConstructorUsedError;
  List<TeacherModel>? get listTeachers => throw _privateConstructorUsedError;
  List<StudentModel>? get listStudents => throw _privateConstructorUsedError;
  List<NewStudentModel>? get listNewStudents =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherStateCopyWith<TeacherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherStateCopyWith<$Res> {
  factory $TeacherStateCopyWith(
          TeacherState value, $Res Function(TeacherState) then) =
      _$TeacherStateCopyWithImpl<$Res, TeacherState>;
  @useResult
  $Res call(
      {BlocStatus statusGetTeacher,
      BlocStatus statusTeachersStudents,
      BlocStatus statusNewTeachersStudents,
      List<TeacherModel>? listTeachers,
      List<StudentModel>? listStudents,
      List<NewStudentModel>? listNewStudents});
}

/// @nodoc
class _$TeacherStateCopyWithImpl<$Res, $Val extends TeacherState>
    implements $TeacherStateCopyWith<$Res> {
  _$TeacherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetTeacher = null,
    Object? statusTeachersStudents = null,
    Object? statusNewTeachersStudents = null,
    Object? listTeachers = freezed,
    Object? listStudents = freezed,
    Object? listNewStudents = freezed,
  }) {
    return _then(_value.copyWith(
      statusGetTeacher: null == statusGetTeacher
          ? _value.statusGetTeacher
          : statusGetTeacher // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusTeachersStudents: null == statusTeachersStudents
          ? _value.statusTeachersStudents
          : statusTeachersStudents // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusNewTeachersStudents: null == statusNewTeachersStudents
          ? _value.statusNewTeachersStudents
          : statusNewTeachersStudents // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listTeachers: freezed == listTeachers
          ? _value.listTeachers
          : listTeachers // ignore: cast_nullable_to_non_nullable
              as List<TeacherModel>?,
      listStudents: freezed == listStudents
          ? _value.listStudents
          : listStudents // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>?,
      listNewStudents: freezed == listNewStudents
          ? _value.listNewStudents
          : listNewStudents // ignore: cast_nullable_to_non_nullable
              as List<NewStudentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherStateImplCopyWith<$Res>
    implements $TeacherStateCopyWith<$Res> {
  factory _$$TeacherStateImplCopyWith(
          _$TeacherStateImpl value, $Res Function(_$TeacherStateImpl) then) =
      __$$TeacherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus statusGetTeacher,
      BlocStatus statusTeachersStudents,
      BlocStatus statusNewTeachersStudents,
      List<TeacherModel>? listTeachers,
      List<StudentModel>? listStudents,
      List<NewStudentModel>? listNewStudents});
}

/// @nodoc
class __$$TeacherStateImplCopyWithImpl<$Res>
    extends _$TeacherStateCopyWithImpl<$Res, _$TeacherStateImpl>
    implements _$$TeacherStateImplCopyWith<$Res> {
  __$$TeacherStateImplCopyWithImpl(
      _$TeacherStateImpl _value, $Res Function(_$TeacherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusGetTeacher = null,
    Object? statusTeachersStudents = null,
    Object? statusNewTeachersStudents = null,
    Object? listTeachers = freezed,
    Object? listStudents = freezed,
    Object? listNewStudents = freezed,
  }) {
    return _then(_$TeacherStateImpl(
      statusGetTeacher: null == statusGetTeacher
          ? _value.statusGetTeacher
          : statusGetTeacher // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusTeachersStudents: null == statusTeachersStudents
          ? _value.statusTeachersStudents
          : statusTeachersStudents // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      statusNewTeachersStudents: null == statusNewTeachersStudents
          ? _value.statusNewTeachersStudents
          : statusNewTeachersStudents // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      listTeachers: freezed == listTeachers
          ? _value._listTeachers
          : listTeachers // ignore: cast_nullable_to_non_nullable
              as List<TeacherModel>?,
      listStudents: freezed == listStudents
          ? _value._listStudents
          : listStudents // ignore: cast_nullable_to_non_nullable
              as List<StudentModel>?,
      listNewStudents: freezed == listNewStudents
          ? _value._listNewStudents
          : listNewStudents // ignore: cast_nullable_to_non_nullable
              as List<NewStudentModel>?,
    ));
  }
}

/// @nodoc

class _$TeacherStateImpl extends _TeacherState {
  const _$TeacherStateImpl(
      {this.statusGetTeacher = BlocStatus.notInitialized,
      this.statusTeachersStudents = BlocStatus.notInitialized,
      this.statusNewTeachersStudents = BlocStatus.notInitialized,
      final List<TeacherModel>? listTeachers,
      final List<StudentModel>? listStudents,
      final List<NewStudentModel>? listNewStudents})
      : _listTeachers = listTeachers,
        _listStudents = listStudents,
        _listNewStudents = listNewStudents,
        super._();

  @override
  @JsonKey()
  final BlocStatus statusGetTeacher;
  @override
  @JsonKey()
  final BlocStatus statusTeachersStudents;
  @override
  @JsonKey()
  final BlocStatus statusNewTeachersStudents;
  final List<TeacherModel>? _listTeachers;
  @override
  List<TeacherModel>? get listTeachers {
    final value = _listTeachers;
    if (value == null) return null;
    if (_listTeachers is EqualUnmodifiableListView) return _listTeachers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<StudentModel>? _listStudents;
  @override
  List<StudentModel>? get listStudents {
    final value = _listStudents;
    if (value == null) return null;
    if (_listStudents is EqualUnmodifiableListView) return _listStudents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NewStudentModel>? _listNewStudents;
  @override
  List<NewStudentModel>? get listNewStudents {
    final value = _listNewStudents;
    if (value == null) return null;
    if (_listNewStudents is EqualUnmodifiableListView) return _listNewStudents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TeacherState(statusGetTeacher: $statusGetTeacher, statusTeachersStudents: $statusTeachersStudents, statusNewTeachersStudents: $statusNewTeachersStudents, listTeachers: $listTeachers, listStudents: $listStudents, listNewStudents: $listNewStudents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherStateImpl &&
            (identical(other.statusGetTeacher, statusGetTeacher) ||
                other.statusGetTeacher == statusGetTeacher) &&
            (identical(other.statusTeachersStudents, statusTeachersStudents) ||
                other.statusTeachersStudents == statusTeachersStudents) &&
            (identical(other.statusNewTeachersStudents,
                    statusNewTeachersStudents) ||
                other.statusNewTeachersStudents == statusNewTeachersStudents) &&
            const DeepCollectionEquality()
                .equals(other._listTeachers, _listTeachers) &&
            const DeepCollectionEquality()
                .equals(other._listStudents, _listStudents) &&
            const DeepCollectionEquality()
                .equals(other._listNewStudents, _listNewStudents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusGetTeacher,
      statusTeachersStudents,
      statusNewTeachersStudents,
      const DeepCollectionEquality().hash(_listTeachers),
      const DeepCollectionEquality().hash(_listStudents),
      const DeepCollectionEquality().hash(_listNewStudents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherStateImplCopyWith<_$TeacherStateImpl> get copyWith =>
      __$$TeacherStateImplCopyWithImpl<_$TeacherStateImpl>(this, _$identity);
}

abstract class _TeacherState extends TeacherState {
  const factory _TeacherState(
      {final BlocStatus statusGetTeacher,
      final BlocStatus statusTeachersStudents,
      final BlocStatus statusNewTeachersStudents,
      final List<TeacherModel>? listTeachers,
      final List<StudentModel>? listStudents,
      final List<NewStudentModel>? listNewStudents}) = _$TeacherStateImpl;
  const _TeacherState._() : super._();

  @override
  BlocStatus get statusGetTeacher;
  @override
  BlocStatus get statusTeachersStudents;
  @override
  BlocStatus get statusNewTeachersStudents;
  @override
  List<TeacherModel>? get listTeachers;
  @override
  List<StudentModel>? get listStudents;
  @override
  List<NewStudentModel>? get listNewStudents;
  @override
  @JsonKey(ignore: true)
  _$$TeacherStateImplCopyWith<_$TeacherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
