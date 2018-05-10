(* *Extremely basic* at this point *)

type data_info = {
  di_name: string;
  di_arity: int;
  di_tag: int;
} [@@deriving to_yojson]

type t = {
  name: string;
  data_types: (int * data_info list) list;
} [@@deriving yojson]
