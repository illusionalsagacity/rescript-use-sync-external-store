# rescript-use-sync-external-store

This is a zero-cost ReScript binding to [use-sync-external-store](https://github.com/facebook/react/tree/main/packages/use-sync-external-store/). Specifically to `use-sync-external-store/shim`.

## Usage

See `__test__/SyncExternalStore_test.res` for usage.

## Migration from use-subscription

If you were using [rescript-use-subscription](https://github.com/illusionalsagacity/rescript-use-subscription) before, migration should be fairly straightforward:

### Before

```rescript
let {useSubscription} = module(UseSubscription)

@react.component
let make = () => {
  let options = React.useMemo(() => {
    UseSubscription.getCurrentValue: () => Some(1),
    subscribe: callback => {
      callback(. Some(1))

      (.) => ()
    },
  })
  let val = useSubscription(options)

  <div>{val->Belt.Option.mapWithDefault(React.null, React.int)}</div>
}
```

### After

```rescript
let val = ref(Some(1))

@react.component
let make = () => {
  let val = SyncExternalStore.use(
    ~getSnapshot=() => val.contents,
    ~subscribe=callback => {
      callback()
      () => ()
    },
    (),
  )

  <div> {val->Belt.Option.mapWithDefault(React.null, React.int)} </div>
}
```
