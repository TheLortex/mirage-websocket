open Lwt.Infix

module Main (S: Conduit_mirage.S) = struct
    module HTTP_Make (HTTP : Mirage_http.S) = struct
        include HTTP
    end

    module HTTP_Cohttp = HTTP_Make (Mirage_http_cohttp)
    module HTTP_AF = HTTP_Make (Mirage_http_httpaf)

    module WS_A = Websocket.Make(HTTP_AF)(S)
    module WS_C = Websocket.Make(HTTP_Cohttp)(S)


    let start conduit =
        WS_A.Mirage.connect conduit >>= fun ws_a ->
        WS_C.Mirage.connect conduit >>= fun ws_c ->
        Lwt.join [WS_A.Mirage.listen (`TCP 8000) ws_a; WS_C.Mirage.listen (`TCP 8001) ws_c]

end