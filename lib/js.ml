(*
XXX
optimize the code whenever possible:
   generate direct operations when the arguments are known well enough
   ===> need to be able to express this in intermediate code...
*)

type t

external inject : 'a -> t = "%identity"
external extract : t -> 'a = "%identity"

external get : t -> string -> t = "caml_js_get"
external set : t -> string -> t -> unit = "caml_js_set"

external call : t -> t -> t array -> t = "caml_js_call"
external fun_call : t -> t array -> t = "caml_js_fun_call"
external meth_call : t -> string -> t array -> t = "caml_js_meth_call"
external new_obj : t -> t array -> t = "caml_js_new"

(* Object and array literals *)
external obj : (string * t) array -> t = "caml_js_obj"
external array_lit : t array -> t = "caml_js_array"

external variable : string -> t = "caml_js_var"

(*
XXX
array/hash access
*)

type string
type 'a array
type bool
external string : string -> t = "%identity"
external array : 'a array -> t = "%identity"

let null = variable "null"

let _true : bool = extract (variable "true")
let _false : bool = extract (variable "false")

