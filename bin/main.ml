open Opium.Std

open Ninomae

let static = 
    Middleware.static
     ~local_path:"./static"
     ~uri_prefix:"/static"
     ()
    ;;

let log_level = Some Logs.Debug

let set_logger () = 
    Logs.set_reporter (Logs_fmt.reporter ());
    Logs.set_level log_level
;;

let app : Opium.App.t =
    App.empty
    |> App.cmd_name "Rest API"
    |> Route.add_route 
;;

let () =
    set_logger ();
    match App.run_command' app with
    | `Ok (app: unit Lwt.t) -> Lwt_main.run app
    | `Error -> exit 1
    | `Not_running -> exit 0
;;