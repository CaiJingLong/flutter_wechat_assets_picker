///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020/3/31 15:37
///
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

/// [ChangeNotifier] for assets picker viewer.
/// 资源选择查看器的 provider model.
class AssetPickerViewerProvider extends ChangeNotifier {
  /// Copy selected assets for editing when constructing.
  /// 构造时深拷贝已选择的资源集合，用于后续编辑。
  AssetPickerViewerProvider(Set<AssetEntity> assets) {
    _currentlySelectedAssets = Set<AssetEntity>.from(assets);
  }

  /// Selected assets in viewer.
  /// 查看器中已选择的资源
  Set<AssetEntity> _currentlySelectedAssets;

  Set<AssetEntity> get currentlySelectedAssets => _currentlySelectedAssets;

  set currentlySelectedAssets(Set<AssetEntity> value) {
    assert(value != null);
    if (value == _currentlySelectedAssets) {
      return;
    }
    _currentlySelectedAssets = value;
    notifyListeners();
  }

  /// 选中资源是否为空
  bool get isSelectedNotEmpty => currentlySelectedAssets?.isNotEmpty ?? false;

  /// Select asset.
  /// 选中资源
  void selectAssetEntity(AssetEntity entity) {
    final Set<AssetEntity> set = Set<AssetEntity>.from(currentlySelectedAssets);
    set.add(entity);
    currentlySelectedAssets = Set<AssetEntity>.from(set);
  }

  /// Un-select asset.
  /// 取消选中资源
  void unSelectAssetEntity(AssetEntity entity) {
    final Set<AssetEntity> set = Set<AssetEntity>.from(currentlySelectedAssets);
    set.remove(entity);
    currentlySelectedAssets = Set<AssetEntity>.from(set);
  }
}
