(** Runtime Error definitions *)

type grain_error =
  | ComparisonError
  | ArithmeticError
  | LogicError
  | IfError
  | OverflowError
  | ArityMismatch
  | CalledNonFunction
  | GetItemNotTuple
  | GetItemIndexNotNumber
  | GetItemIndexTooSmall
  | GetItemIndexTooLarge
  | SetItemNotTuple
  | SetItemIndexNotNumber
  | SetItemIndexTooSmall
  | SetItemIndexTooLarge
  | GenericNumberError

let all_grain_errors = [
  ComparisonError;
  ArithmeticError;
  LogicError;
  IfError;
  OverflowError;
  ArityMismatch;
  CalledNonFunction;
  GetItemNotTuple;
  GetItemIndexNotNumber;
  GetItemIndexTooSmall;
  GetItemIndexTooLarge;
  SetItemNotTuple;
  SetItemIndexNotNumber;
  SetItemIndexTooSmall;
  SetItemIndexTooLarge;
  GenericNumberError;
]

let err_COMP_NOT_NUM              = 0
let err_ARITH_NOT_NUM             = 1
let err_LOGIC_NOT_BOOL            = 2
let err_IF_NOT_BOOL               = 3
let err_OVERFLOW                  = 4
let err_GET_NOT_TUP               = 5
let err_GET_ITEM_INDEX_NOT_NUMBER = 6
let err_GET_ITEM_INDEX_TOO_SMALL  = 7
let err_GET_ITEM_INDEX_TOO_LARGE  = 8
let err_CALLED_NON_FUNCTION       = 9
let err_ARITY_MISMATCH            = 10
let err_SET_NOT_TUP               = 12
let err_SET_ITEM_INDEX_NOT_NUMBER = 13
let err_SET_ITEM_INDEX_TOO_SMALL  = 14
let err_SET_ITEM_INDEX_TOO_LARGE  = 15
let err_GENERIC_NUM               = 99

let code_of_error = function
  | ArithmeticError -> err_ARITH_NOT_NUM
  | ComparisonError -> err_COMP_NOT_NUM
  | IfError -> err_IF_NOT_BOOL
  | LogicError -> err_LOGIC_NOT_BOOL
  | ArityMismatch -> err_ARITY_MISMATCH
  | CalledNonFunction -> err_CALLED_NON_FUNCTION
  | GetItemNotTuple -> err_GET_NOT_TUP
  | GetItemIndexNotNumber -> err_GET_ITEM_INDEX_NOT_NUMBER
  | GetItemIndexTooSmall -> err_GET_ITEM_INDEX_TOO_SMALL
  | GetItemIndexTooLarge -> err_GET_ITEM_INDEX_TOO_LARGE
  | SetItemNotTuple -> err_SET_NOT_TUP
  | SetItemIndexNotNumber -> err_SET_ITEM_INDEX_NOT_NUMBER
  | SetItemIndexTooLarge -> err_SET_ITEM_INDEX_TOO_LARGE
  | SetItemIndexTooSmall -> err_SET_ITEM_INDEX_TOO_SMALL
  | GenericNumberError -> err_GENERIC_NUM
  | OverflowError -> err_OVERFLOW

let label_of_error = function
  | ArithmeticError -> "error_not_number_arith"
  | ComparisonError -> "error_not_number_comp"
  | IfError -> "error_not_boolean_if"
  | LogicError -> "error_not_boolean_logic"
  | ArityMismatch -> "error_arity_mismatch"
  | CalledNonFunction -> "error_called_non_function"
  | GenericNumberError -> "error_not_number_generic"
  | GetItemNotTuple -> "error_not_tuple_get_item"
  | GetItemIndexNotNumber -> "error_not_number_get_item_idx"
  | GetItemIndexTooSmall -> "error_too_small_get_item_idx"
  | GetItemIndexTooLarge -> "error_too_large_get_item_idx"
  | SetItemNotTuple -> "error_not_tuple_set_item"
  | SetItemIndexNotNumber -> "error_not_number_set_item_idx"
  | SetItemIndexTooSmall -> "error_too_small_set_item_idx"
  | SetItemIndexTooLarge -> "error_too_large_set_item_idx"
  | OverflowError -> "error_overflow"

let error_of_code c =
  match c with
  | x when x = err_ARITH_NOT_NUM -> ArithmeticError
  | x when x = err_COMP_NOT_NUM -> ComparisonError
  | x when x = err_IF_NOT_BOOL -> IfError
  | x when x = err_LOGIC_NOT_BOOL -> LogicError
  | x when x = err_ARITY_MISMATCH -> ArityMismatch
  | x when x = err_CALLED_NON_FUNCTION -> CalledNonFunction
  | x when x = err_GET_NOT_TUP -> GetItemNotTuple
  | x when x = err_GET_ITEM_INDEX_NOT_NUMBER -> GetItemIndexNotNumber
  | x when x = err_GET_ITEM_INDEX_TOO_SMALL -> GetItemIndexTooSmall
  | x when x = err_GET_ITEM_INDEX_TOO_LARGE -> GetItemIndexTooLarge
  | x when x = err_SET_NOT_TUP -> SetItemNotTuple
  | x when x = err_SET_ITEM_INDEX_NOT_NUMBER -> SetItemIndexNotNumber
  | x when x = err_SET_ITEM_INDEX_TOO_LARGE -> SetItemIndexTooLarge
  | x when x = err_SET_ITEM_INDEX_TOO_SMALL -> SetItemIndexTooSmall
  | x when x = err_GENERIC_NUM -> GenericNumberError
  | x when x = err_OVERFLOW -> OverflowError
  | c -> failwith (Printf.sprintf "Unknown error code: %d" c)

