open Mirage


let stack = generic_stackv4 default_network
let conduit_direct = conduit_direct ~tls:false stack


let main =
  let packages = [
    package "mirage-websocket";
    package ~sublibs:["httpaf";"cohttp"] "mirage-http"
  ] in
  foreign
    ~packages
    "Unikernel.Main" (conduit @-> job)

let () =
  register "main" [main $ conduit_direct]