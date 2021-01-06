open Opium.Std

(** {{1} Type aliases for clearer documentation and explication} *)

type 'err caqti_conn_pool =
  (Caqti_lwt.connection, [> Caqti_error.connect] as 'err) Caqti_lwt.Pool.t

type ('res, 'err) query =
  Caqti_lwt.connection -> ('res, [< Caqti_error.t ] as 'err) result Lwt.t

(** {{1} API for the Opium app database middleware }*)

val middleware : App.builder
(** [middleware app] equips the [app] with the database pool needed by the
    functions in [Update] and [Get]. It cannot (and should not) be accessed
    except through the API in this module. *)
