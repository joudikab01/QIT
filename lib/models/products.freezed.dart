// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Products {
  List<Product> get pproducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsCopyWith<Products> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsCopyWith<$Res> {
  factory $ProductsCopyWith(Products value, $Res Function(Products) then) =
      _$ProductsCopyWithImpl<$Res>;
  $Res call({List<Product> pproducts});
}

/// @nodoc
class _$ProductsCopyWithImpl<$Res> implements $ProductsCopyWith<$Res> {
  _$ProductsCopyWithImpl(this._value, this._then);

  final Products _value;
  // ignore: unused_field
  final $Res Function(Products) _then;

  @override
  $Res call({
    Object? pproducts = freezed,
  }) {
    return _then(_value.copyWith(
      pproducts: pproducts == freezed
          ? _value.pproducts
          : pproducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
abstract class _$ProductsCopyWith<$Res> implements $ProductsCopyWith<$Res> {
  factory _$ProductsCopyWith(_Products value, $Res Function(_Products) then) =
      __$ProductsCopyWithImpl<$Res>;
  @override
  $Res call({List<Product> pproducts});
}

/// @nodoc
class __$ProductsCopyWithImpl<$Res> extends _$ProductsCopyWithImpl<$Res>
    implements _$ProductsCopyWith<$Res> {
  __$ProductsCopyWithImpl(_Products _value, $Res Function(_Products) _then)
      : super(_value, (v) => _then(v as _Products));

  @override
  _Products get _value => super._value as _Products;

  @override
  $Res call({
    Object? pproducts = freezed,
  }) {
    return _then(_Products(
      pproducts: pproducts == freezed
          ? _value.pproducts
          : pproducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_Products with DiagnosticableTreeMixin implements _Products {
  _$_Products({required final List<Product> pproducts})
      : _pproducts = pproducts;

  final List<Product> _pproducts;
  @override
  List<Product> get pproducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pproducts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Products(pproducts: $pproducts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Products'))
      ..add(DiagnosticsProperty('pproducts', pproducts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Products &&
            const DeepCollectionEquality().equals(other.pproducts, pproducts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pproducts));

  @JsonKey(ignore: true)
  @override
  _$ProductsCopyWith<_Products> get copyWith =>
      __$ProductsCopyWithImpl<_Products>(this, _$identity);
}

abstract class _Products implements Products {
  factory _Products({required final List<Product> pproducts}) = _$_Products;

  @override
  List<Product> get pproducts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductsCopyWith<_Products> get copyWith =>
      throw _privateConstructorUsedError;
}
