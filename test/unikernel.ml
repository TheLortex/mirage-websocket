open Lwt.Infix

module Main (S: Conduit_mirage.S) = struct
    module HTTP_Make (HTTP : Mirage_http.S) = struct
        include HTTP
    end

    module HTTP = HTTP_Make (Mirage_http_cohttp)
    module Server = HTTP.Server (S)

    module Websocket = Websocket.Make(HTTP)(S)

    module Ws = Websocket.Mirage

    let start conduit =
        Ws.connect conduit >>= fun ws ->
        Ws.listen ws

end