open Opium.Std

let index  = get "/" 
begin fun _req -> 
    respond' @@ `String "Index"
end;;

let route_map = [index]

let add_route app = 
    Core.List.fold ~f:(fun app route -> route app) ~init:app route_map