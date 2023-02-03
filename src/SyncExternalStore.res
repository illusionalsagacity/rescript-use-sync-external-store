/***
 * Bindings to the use-sync-external-store shim
 */

/**
 * ~subscribe: function to register a callback that is called whenever the store changes.
 * ~getSnapshot: function that returns the current value of the store.
 * ~getServerSnapshot: optional function that returns the snapshot used during server rendering.
 *
 * https://github.com/facebook/react/blob/main/packages/use-sync-external-store/src/useSyncExternalStoreShimClient.js
 */
@genType
@module("use-sync-external-store/shim")
external use: (
  ~subscribe: (@uncurry unit => unit, @uncurry unit) => unit,
  ~getSnapshot: unit => 'snapshot,
  ~getServerSnapshot: unit => 'snapshot=?,
  unit,
) => 'snapshot = "useSyncExternalStore"

/**
 * ~subscribe: function to register a callback that is called whenever the store changes.
 * ~getSnapshot: function that returns the current value of the store.
 * ~getServerSnapshot: optional function that returns the snapshot used during server rendering.
 * ~selector: function that returns a selection of the current value of the store.
 * ~isEqual: optional function that determines if the selection values are equal.
 *
 * https://github.com/facebook/react/blob/main/packages/use-sync-external-store/src/useSyncExternalStoreWithSelector.js
 */
@genType
@module("use-sync-external-store/shim/withSelector")
external useWithSelector: (
  ~subscribe: (@uncurry unit => unit, @uncurry unit) => unit,
  ~getSnapshot: unit => 'snapshot,
  ~getServerSnapshot: unit => 'snapshot=?,
  ~selector: 'snapshot => 'selection,
  ~isEqual: @uncurry ('selection, 'selection) => bool=?,
  unit,
) => 'selection = "useSyncExternalStoreWithSelector"
