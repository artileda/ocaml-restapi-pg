## README

This example rest api using Opium (OCaml) + Postgresql.


### Reproduce

1. Install `libpq-dev` or postgresql header for caqti-driver-postgresql binding.
2. ```
dune init proj [your project name] --libs opium alcotest caqti caqti-driver-postgresql caqti-lwt
   tyxml lwt.unix core logs.fmt --ppx ppx_rapper
```
3. Install the deps : 
```opam install opium alcotest caqti caqti-driver-postgresql caqti-lwt
   tyxml lwt.unix core logs.fmt ppx_rapper ```
4.  Run ```dune exec [your project name]````