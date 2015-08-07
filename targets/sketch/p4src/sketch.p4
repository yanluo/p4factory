// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"

/*Counter table metadata */
header_type counter_table_metadata_t {
  fields{     
      h_v : 16;
   
  }
}



metadata counter_table_metadata_t counter_table_metadata1;
metadata counter_table_metadata_t counter_table_metadata2;
metadata counter_table_metadata_t counter_table_metadata3;


/* 3 ROWS OF COUNTERS THAT IS DEPTH(d)=3 */
register r1 {
    width : 10;
    static : table_data_array1;
    instance_count : 544;   //w=544 //single array of 544 entries   
}

register r2 {
    width : 10;
    static : table_data_array2;
    instance_count : 544;   //w=544 //single array of 544 entries   
   
}

register r3 {
    width : 10;
    static : table_data_array3;
    instance_count : 544;   //w=544 //single array of 544 entries   
   
}


table table_data_array1{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          inc_counter1;   
          no_op;
       }
    size : 544;
}


table table_data_array2{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          inc_counter2;   
          no_op;
       }
    size : 544;
}

table table_data_array3{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          inc_counter3;   
          no_op;
       }
    size : 544;
}         

action _drop() {
    drop();
}

action no_op() {
   
}


action inc_counter1() {
	register_read(counter_table_metadata1.h_v, r1, hashvalue1.hash_value1);
	add_to_field(counter_table_metadata1.h_v, 0x01); //adding 1 to metadata field
	register_write(r1, hashvalue1.hash_value1, counter_table_metadata1.h_v);//writing value from metadata field to register with location of hash value
 
}

action inc_counter2() {
	register_read(counter_table_metadata2.h_v, r2, hashvalue2.hash_value2);
	add_to_field(counter_table_metadata2.h_v, 0x01);
	register_write(r2, hashvalue2.hash_value2, counter_table_metadata2.h_v);
}

action inc_counter3() {
	register_read(counter_table_metadata3.h_v, r3, hashvalue3.hash_value3);
	add_to_field(counter_table_metadata3.h_v, 0x01);
	register_write(r3, hashvalue3.hash_value3, counter_table_metadata3.h_v);
}


header_type routing_metadata_t {
    fields {
        nhop_ipv4 : 32;
    }
}

metadata routing_metadata_t routing_metadata;

action set_nhop(nhop_ipv4, port) {
    modify_field(routing_metadata.nhop_ipv4, nhop_ipv4);
    modify_field(standard_metadata.egress_spec, port);
    add_to_field(ipv4.ttl, -1);
}

table ipv4_lpm {
    reads {
        ipv4.dstAddr : lpm;
    }
    actions {
        set_nhop;
        _drop;
    }
    size: 1024;
}

action set_dmac(dmac) {
    modify_field(ethernet.dstAddr, dmac);
}

table forward {
    reads {
        routing_metadata.nhop_ipv4 : exact;
    }
    actions {
        set_dmac;
        _drop;
    }
    size: 512;
}

action rewrite_mac(smac) {
    modify_field(ethernet.srcAddr, smac);
}

table send_frame {
    reads {
        standard_metadata.egress_port: exact;
    }
    actions {
        rewrite_mac;
        _drop;
    }
    size: 256;
}



control ingress {
    apply(ipv4_lpm);
     apply(table_data_array1);
     apply(table_data_array2);
     apply(table_data_array3);
    apply(forward);
}

control egress {
    apply(send_frame);
}
