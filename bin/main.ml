open! Core

let () = print_endline "Hello, World!"

(* How do we represent like a voltage source or something then? *)
(* If we make everything unique type constructions it gets somewhat bloated *)
module Component = struct
  module Element = struct
    type t =
      | Base_passive
      | Independent_source
  end

  (* Sum type variant *)
  module Kind = struct
    type t = 
      | Resistor (* Constructor *)
      | Capacitor
      | Inductor
      | Memristor
  end    
  
  type t = 
  {   name  : string
    ; kind  : Kind.t
    ; elem  : Element.t
  }
  
  (* This returns a Component.t, which itself contains a *)
  (*let create ~name ~elem_t ~kind : t = *)
  let create ~(name : string) : t = 
  {
      name = name 
      ; kind = Kind.Resistor
      ; elem = Element.Base_passive
  }
  
end

module Circuit = struct
  type t = {
    components : Component.t list
  }
  
  let create ~(name : string) : t =
    let r1 = Component.create ~name:"r1" in
    (*let compsants : Component.t list = List.init 1 ~f:() in*)
    let compsants : Component.t list = [r1;] in
  {
    components = compsants
  }
end

let () = 
  printf "Beginning circuit execution!";
  
  
;;
