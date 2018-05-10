open Grain_parsing
open Grain_typed
open Anftree

type loc = Location.t
type env = Env.t
type ident = Ident.t

let default_loc = Location.dummy_loc
let default_env = Env.empty

let or_default_loc = Option.default default_loc
let or_default_env = Option.default default_env

module Imm = struct
  let mk ?loc ?env d =
    {imm_desc=d;
     imm_loc=or_default_loc loc;
     imm_env=or_default_env env}
  let id ?loc ?env id = mk ?loc ?env (ImmId id)
  let const ?loc ?env const = mk ?loc ?env (ImmConst const)
end

module Comp = struct
  let mk ?loc ?env d =
    {comp_desc=d;
     comp_loc=or_default_loc loc;
     comp_env=or_default_env env}
  let imm ?loc ?env imm = mk ?loc ?env (CImmExpr imm)
  let prim1 ?loc ?env p1 a = mk ?loc ?env (CPrim1(p1, a))
  let prim2 ?loc ?env p2 a1 a2 = mk ?loc ?env (CPrim2(p2, a1, a2))
  let tuple ?loc ?env elts = mk ?loc ?env (CTuple elts)
  let construct ?loc ?env tidx vidx elts = mk ?loc ?env (CConstruct(tidx, vidx, elts))
  let tuple_get ?loc ?env tup idx = mk ?loc ?env (CGetTupleItem(tup, idx))
  let tuple_set ?loc ?env tup idx value = mk ?loc ?env (CSetTupleItem(tup, idx, value))
  let if_ ?loc ?env cond tru fals = mk ?loc ?env (CIf(cond, tru, fals))
  let switch ?loc ?env arg branches = mk ?loc ?env (CSwitch(arg, branches))
  let app ?loc ?env func args = mk ?loc ?env (CApp(func, args))
  let app_builtin ?loc ?env modname name args = mk ?loc ?env (CAppBuiltin(modname, name, args))
  let lambda ?loc ?env args body = mk ?loc ?env (CLambda(args, body))
  let string ?loc ?env s = mk ?loc ?env (CString s)
end

module AExp = struct
  let mk ?loc ?env d =
    {anf_desc=d;
     anf_loc=or_default_loc loc;
     anf_env=or_default_env env}
  let let_ ?loc ?env ?glob:(glob=Nonglobal) rec_flag binds body = mk ?loc ?env (AELet(glob, rec_flag, binds, body))
  let seq ?loc ?env hd tl = mk ?loc ?env (AESeq(hd, tl))
  let comp ?loc ?env e = mk ?loc ?env (AEComp(e))
end

module Imp = struct
  let mk use_id d s=
    {imp_use_id=use_id;
     imp_desc=d;
     imp_shape=s;}
  let grain_value a md name s = mk a (GrainValue(md, name)) s
  let wasm_func a md name s = mk a (WasmFunction(md, name)) s
  let js_func a md name s = mk a (JSFunction(md, name)) s
end

