let value = ref(1)

let subscribe = cb => {
  // do something
  Js.Console.log("subscribing...")

  let timer = Js.Global.setInterval(() => {
    value := value.contents + 1
    cb()
  }, 1000)

  () => {
    // unsubscribe
    Js.Console.log("unsubscribing...")
    Js.Global.clearInterval(timer)
    ()
  }
}

let getSnapshot = () => value

@react.component
let make = () => {
  let valueA = SyncExternalStore.use(~subscribe, ~getSnapshot, ())
  let valueB = SyncExternalStore.useWithSelector(
    ~subscribe,
    ~getSnapshot,
    ~isEqual=(a, b) => a == b,
    ~selector=ref => ref.contents,
    (),
  )

  <div>
    <span> {React.int(valueA.contents)} </span>
    <span> {React.int(valueB)} </span>
  </div>
}
