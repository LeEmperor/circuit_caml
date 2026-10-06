(* open! Core *)

let () = print_endline "Hello, World!"

module Component = struct
  (* Sum type variant *)
  module Kind = struct
    type t = 
      | Resistor (* Constructor *)
      | Capacitor
  end    
  
  type t = 
  {   name  : string
    ; kind  : Kind.t
    ; value : float
  }
end

module Circuit = struct
  type t = {
    components : Component.t list
  }
end
