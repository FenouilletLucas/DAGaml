type uniq = int * int
type pair = int * int * int

type op_tag = CpTypes.op_tag
type ttag	= CpTypes.ttag

type edge_state = bool * uniq
type node_state = bool * pair
type node_and_state = bool * bool * pair
type node_xor_state =               pair
type tacx_state = ttag * pair

type node_cstate = Bitv.t
type edge_cstate = Bitv.t
type tacx_cstate = Bitv.t

type 'a edge = edge_state * (unit, 'a) Utils.gnode
type 'a node = node_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a tacx = tacx_state * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode


type 'a cedge = edge_cstate * (unit, 'a) Utils.gnode
type 'a cnode = node_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
type 'a ctacx = tacx_cstate * (unit, 'a) Utils.gnode * (unit, 'a) Utils.gnode
