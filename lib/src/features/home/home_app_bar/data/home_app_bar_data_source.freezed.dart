// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_app_bar_data_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppBarRepositoryDataSource {
  bool get wasTapped => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppBarRepositoryDataSourceCopyWith<AppBarRepositoryDataSource>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppBarRepositoryDataSourceCopyWith<$Res> {
  factory $AppBarRepositoryDataSourceCopyWith(AppBarRepositoryDataSource value,
          $Res Function(AppBarRepositoryDataSource) then) =
      _$AppBarRepositoryDataSourceCopyWithImpl<$Res,
          AppBarRepositoryDataSource>;
  @useResult
  $Res call({bool wasTapped});
}

/// @nodoc
class _$AppBarRepositoryDataSourceCopyWithImpl<$Res,
        $Val extends AppBarRepositoryDataSource>
    implements $AppBarRepositoryDataSourceCopyWith<$Res> {
  _$AppBarRepositoryDataSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasTapped = null,
  }) {
    return _then(_value.copyWith(
      wasTapped: null == wasTapped
          ? _value.wasTapped
          : wasTapped // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppBarRepositoryDataSourceCopyWith<$Res>
    implements $AppBarRepositoryDataSourceCopyWith<$Res> {
  factory _$$_AppBarRepositoryDataSourceCopyWith(
          _$_AppBarRepositoryDataSource value,
          $Res Function(_$_AppBarRepositoryDataSource) then) =
      __$$_AppBarRepositoryDataSourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool wasTapped});
}

/// @nodoc
class __$$_AppBarRepositoryDataSourceCopyWithImpl<$Res>
    extends _$AppBarRepositoryDataSourceCopyWithImpl<$Res,
        _$_AppBarRepositoryDataSource>
    implements _$$_AppBarRepositoryDataSourceCopyWith<$Res> {
  __$$_AppBarRepositoryDataSourceCopyWithImpl(
      _$_AppBarRepositoryDataSource _value,
      $Res Function(_$_AppBarRepositoryDataSource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasTapped = null,
  }) {
    return _then(_$_AppBarRepositoryDataSource(
      wasTapped: null == wasTapped
          ? _value.wasTapped
          : wasTapped // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppBarRepositoryDataSource implements _AppBarRepositoryDataSource {
  const _$_AppBarRepositoryDataSource({this.wasTapped = false});

  @override
  @JsonKey()
  final bool wasTapped;

  @override
  String toString() {
    return 'AppBarRepositoryDataSource(wasTapped: $wasTapped)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppBarRepositoryDataSource &&
            (identical(other.wasTapped, wasTapped) ||
                other.wasTapped == wasTapped));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wasTapped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppBarRepositoryDataSourceCopyWith<_$_AppBarRepositoryDataSource>
      get copyWith => __$$_AppBarRepositoryDataSourceCopyWithImpl<
          _$_AppBarRepositoryDataSource>(this, _$identity);
}

abstract class _AppBarRepositoryDataSource
    implements AppBarRepositoryDataSource {
  const factory _AppBarRepositoryDataSource({final bool wasTapped}) =
      _$_AppBarRepositoryDataSource;

  @override
  bool get wasTapped;
  @override
  @JsonKey(ignore: true)
  _$$_AppBarRepositoryDataSourceCopyWith<_$_AppBarRepositoryDataSource>
      get copyWith => throw _privateConstructorUsedError;
}
