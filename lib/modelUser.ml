open! Core

type ('res, 'err) query_result = ('res, [> Caqti_error.call_or_retrieve ] as 'err) result Lwt.t

type t_out = {
    id: int;
    email: string;
    login_token: string;
}

type t_in = {
    email: string;
}

let add : t_in -> Caqti_lwt.connection -> (unit,'err ) query_result =
    [%rapper execute
        {sql|
        INSERT INTO users(email)
        VALUES (%string{email})
        |sql}
        record_in
    ]

let verify: token:string -> Caqti_lwt.connection -> (t_out list,'err) query_result =
    [%rapper get_many
        {sql|
            SELECT @int{id},@string{email},@string{login_token} FROM users 
            WHERE login_token = %string{token}
        |sql}
        record_out
    ]