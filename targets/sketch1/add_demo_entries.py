# Copyright 2013-present Barefoot Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------------------------------#
'''Summary: Code is for table entries used for count-minimum sketch (point query) implementation.The  
         "match-spec" variable refers to "reads" of actual p4 program. It is entry for command that 
          tells table what field parse representation to use as look up.The "action_spec" variable 
          refers to "actions" of actual p4 program. It is entry for action which have parameters.
          The first 3 tables below have both variables as above taken from simple_router demo.Whereas,
          other newly added table entries dont require it according to p4 program, which are empty at 
          first and will be later filled during runtime. In order to increase entries of hosts i.e IP address,
          you just have duplicate first 3 table entries with required values.'''

#!/usr/bin/python

import sys
import os
_THIS_DIR = os.path.dirname(os.path.realpath(__file__))
sys.path.append(os.path.join(_THIS_DIR, "of-tests", "pd_thrift"))

sys.path.append(os.path.join(_THIS_DIR, "..", "..",
                             "submodules", "oft-infra"))
from utils import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.protocol import TMultiplexedProtocol

from p4_pd_rpc.ttypes import *
from res_pd_rpc.ttypes import *

import p4_pd_rpc.sketch as p4_module
import mc_pd_rpc.mc as mc_module
import conn_mgr_pd_rpc.conn_mgr as conn_mgr_module

transport = TSocket.TSocket('localhost', 22222)
transport = TTransport.TBufferedTransport(transport)
bprotocol = TBinaryProtocol.TBinaryProtocol(transport)

mc_protocol = TMultiplexedProtocol.TMultiplexedProtocol(bprotocol, "mc")
conn_mgr_protocol = TMultiplexedProtocol.TMultiplexedProtocol(bprotocol, "conn_mgr")
p4_protocol = TMultiplexedProtocol.TMultiplexedProtocol(bprotocol, "sketch")

client = p4_module.Client(p4_protocol)
mc = mc_module.Client(mc_protocol)
conn_mgr = conn_mgr_module.Client(conn_mgr_protocol)
transport.open()

sess_hdl = conn_mgr.client_init(16)
dev_tgt = DevTarget_t(0, hex_to_i16(0xFFFF))

'''--------------------------TABLE ENTRIES STARTS FROM HERE---------------------------------------'''
client.copy_to_cpu_set_default_action_do_copy_to_cpu(sess_hdl, dev_tgt)
client.redirect_set_default_action_no_op(sess_hdl, dev_tgt) 

#------------------send_frame table entries with parameters for 3 hosts-----------------------------# 
match_spec = sketch_send_frame_match_spec_t(standard_metadata_egress_port = 1)
action_spec = sketch_rewrite_mac_action_spec_t(action_smac=macAddr_to_string("00:aa:bb:00:00:00"))
client.send_frame_table_add_with_rewrite_mac(sess_hdl, dev_tgt, match_spec,action_spec)

match_spec = sketch_send_frame_match_spec_t(standard_metadata_egress_port=2)
action_spec = sketch_rewrite_mac_action_spec_t(action_smac=macAddr_to_string("00:aa:bb:00:00:01"))
client.send_frame_table_add_with_rewrite_mac(sess_hdl, dev_tgt, match_spec,action_spec)

match_spec = sketch_send_frame_match_spec_t(standard_metadata_egress_port = 4)
action_spec = sketch_rewrite_mac_action_spec_t(action_smac=macAddr_to_string("00:aa:bb:00:00:03"))
client.send_frame_table_add_with_rewrite_mac(sess_hdl, dev_tgt, match_spec,action_spec)
#----------------------------------------------------------------------------------------------------#

#-----------------------forward table entries with parameters for 3 hosts----------------------------# 
match_spec = sketch_forward_match_spec_t(routing_metadata_nhop_ipv4 = ipv4Addr_to_i32("10.0.0.10"))
action_spec = sketch_set_dmac_action_spec_t(action_dmac=macAddr_to_string("00:04:00:00:00:00"))
client.forward_table_add_with_set_dmac(sess_hdl, dev_tgt, match_spec,action_spec)

match_spec = sketch_forward_match_spec_t(routing_metadata_nhop_ipv4=ipv4Addr_to_i32("10.0.1.10"))
action_spec = sketch_set_dmac_action_spec_t(action_dmac=macAddr_to_string("00:04:00:00:00:01"))
client.forward_table_add_with_set_dmac(sess_hdl, dev_tgt, match_spec,action_spec)

match_spec = sketch_forward_match_spec_t(routing_metadata_nhop_ipv4=ipv4Addr_to_i32("10.0.3.10"))
action_spec = sketch_set_dmac_action_spec_t(action_dmac=macAddr_to_string("00:04:00:00:00:03"))
client.forward_table_add_with_set_dmac(sess_hdl, dev_tgt, match_spec,action_spec)
#------------------------------------------------------------------------------------------------------#

#----------------------ipv4_lpm entries with parameters for 3 hosts------------------------------------#
match_spec = sketch_ipv4_lpm_match_spec_t(ipv4_dstAddr=ipv4Addr_to_i32("10.0.0.10"),ipv4_dstAddr_prefix_length = 32)
action_spec = sketch_set_nhop_action_spec_t(action_nhop_ipv4=ipv4Addr_to_i32("10.0.0.10"), action_port=1)
client.ipv4_lpm_table_add_with_set_nhop(sess_hdl, dev_tgt, match_spec, action_spec)

match_spec = sketch_ipv4_lpm_match_spec_t(ipv4_dstAddr=ipv4Addr_to_i32("10.0.1.10"),ipv4_dstAddr_prefix_length = 32)
action_spec = sketch_set_nhop_action_spec_t(action_nhop_ipv4=ipv4Addr_to_i32("10.0.1.10"), action_port=2)
client.ipv4_lpm_table_add_with_set_nhop(sess_hdl, dev_tgt, match_spec, action_spec)

match_spec = sketch_ipv4_lpm_match_spec_t(ipv4_dstAddr=ipv4Addr_to_i32("10.0.3.10"),ipv4_dstAddr_prefix_length = 32)
action_spec = sketch_set_nhop_action_spec_t(action_nhop_ipv4=ipv4Addr_to_i32("10.0.3.10"), action_port=4)
client.ipv4_lpm_table_add_with_set_nhop(sess_hdl, dev_tgt, match_spec, action_spec)
#-------------------------------------------------------------------------------------------------------#

#-------------------------newly added table entries without parameters and 'no reads'-------------------#
client.table_temp_table_add_with_temp(sess_hdl, dev_tgt)           # table_temp table entry
client.minimum_val3_table_add_with_min_val3(sess_hdl, dev_tgt)     # minimum_val3 table entry
client.minimum_val2_table_add_with_min_val2(sess_hdl, dev_tgt)     # minimum_val2 table entry
client.minimum_val1_table_add_with_min_val1(sess_hdl, dev_tgt)     # minimum_val1 table entry
client.old_table_entry_array_table_add_with_again_count(sess_hdl, dev_tgt)# old_table_entry_array table entry
client.new_table_entry_array_table_add_with_first_time_count(sess_hdl, dev_tgt)#new_table_entry_array table entry
client.same_minimum_count_table_add_with_same_minimum(sess_hdl, dev_tgt)#same_minimum_count table entry
#--------------------------------------------------------------------------------------------------------#

#------------------------------------CLONING ENTRIES-----------------------------------------------------#
# 1 means clone
match_spec1 = sketch_redirect_match_spec_t(standard_metadata_instance_type = 1)#redirect table
client.redirect_table_add_with_do_cpu_encap(sess_hdl, dev_tgt, match_spec1)

match_spec2 = sketch_set_myvalue_match_spec_t(standard_metadata_instance_type = 1)#set_myvalue
client.set_myvalue_table_add_with_do_set_myvalue(sess_hdl, dev_tgt, match_spec2)

CPU_PORT_ID = 3 # Port which sends D-packet to wireshark for viewing values
CPU_MIRROR_SESSION_ID = 250
client. mirroring_mapping_add(CPU_MIRROR_SESSION_ID, CPU_PORT_ID)
#---------------------------------------------------------------------------------------------------------#
