// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"

/*Counter table metadata */
header_type counter_table_metadata_t {
  fields{     
      h_v : 32;
      count : 32;
   
  }
}



metadata counter_table_metadata_t counter_table_metadata1;
metadata counter_table_metadata_t counter_table_metadata2;
metadata counter_table_metadata_t counter_table_metadata3;


/* 3 ROWS OF COUNTERS THAT IS DEPTH(d)=3 */
register r1 {
    width : 16;
    //static : table_data_array1;
    instance_count : 544;   //w=544 //single array of 544 entries   
}

register r2 {
    width : 16;
    //static : table_data_array2;
    instance_count : 544;   //w=544 //single array of 544 entries   
   
}

register r3 {
    width : 16;
    //static : table_data_array3;
    instance_count : 544;   //w=544 //single array of 544 entries   
   
}


table table_data_array1{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          first_time_count1;   
          no_op;
       }
    size : 544;
}

table new_table_data_array1{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions { 
	  next_time_count1;
          no_op;
       }
    size : 544;
}


table table_data_array2{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          first_time_count2;   
          no_op;
       }
    size : 544;
}

table new_table_data_array2{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions { 
	  next_time_count2;
          no_op;
       }
    size : 544;
}

table table_data_array3{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions {
          first_time_count3;   
          no_op;
       }
    size : 544;
}  

table new_table_data_array3{
     reads {
           ipv4.srcAddr : exact;          
     } 
    actions { 
	  next_time_count3;
          no_op;
       }
    size : 544;
}       

action _drop() {
    drop();
}

action no_op() {
   
}


action first_time_count1() {
 //modify_field_with_hash_based_offset(counter_table_metadata1.h_v, 0, ipv4_hash1, 545);
	//register_read(counter_table_metadata1.h_v, r1, hashvalue1.hash_value1);
	add_to_field(counter_table_metadata1.count, 0x01); //adding 1 to metadata field
	register_write(r1, hashvalue1.hash_value1, counter_table_metadata1.count);//writing value from metadata field to register with location of hash value
}
action next_time_count1(){
	//register_read(counter_table_metadata1.h_v, r1, hashvalue1.hash_value1);
	add(counter_table_metadata1.count, counter_table_metadata1.count, 0x01);
	register_write(r1, hashvalue1.hash_value1, counter_table_metadata1.count);
}


action first_time_count2() {
	//register_read(counter_table_metadata2.h_v, r2, hashvalue2.hash_value2);
	add_to_field(counter_table_metadata2.count, 0x01);
	register_write(r2, hashvalue2.hash_value2, counter_table_metadata2.count);
}
action next_time_count2(){
	//register_read(counter_table_metadata2.h_v, r2, hashvalue2.hash_value2);
	add(counter_table_metadata2.count, counter_table_metadata2.count, 0x01);
	register_write(r2, hashvalue2.hash_value2, counter_table_metadata2.count);
}



action first_time_count3() {
	//register_read(counter_table_metadata3.h_v, r3, hashvalue3.hash_value3);
	add_to_field(counter_table_metadata3.count, 0x01);
	register_write(r3, hashvalue3.hash_value3, counter_table_metadata3.count);
}
action next_time_count3(){
	//register_read(counter_table_metadata3.h_v, r3, hashvalue3.hash_value3);
	add(counter_table_metadata3.count, counter_table_metadata3.count, 0x01);
	register_write(r3, hashvalue3.hash_value3, counter_table_metadata3.count);
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
    register_read(counter_table_metadata1.count, r1, hashvalue1.hash_value1);
    modify_field_with_hash_based_offset(counter_table_metadata1.h_v, 0, ipv4_hash1, 545);
    register_read(counter_table_metadata2.count, r2, hashvalue2.hash_value2);
    modify_field_with_hash_based_offset(counter_table_metadata2.h_v, 0, ipv4_hash2, 545);
    register_read(counter_table_metadata3.count, r3, hashvalue3.hash_value3);
    modify_field_with_hash_based_offset(counter_table_metadata3.h_v, 0, ipv4_hash3, 545);
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
if(counter_table_metadata1.h_v == hashvalue1.hash_value1){
    apply(new_table_data_array1);
     }
    else {
         apply(table_data_array1);
     }
if(counter_table_metadata2.h_v == hashvalue2.hash_value2){
    apply(new_table_data_array2);
     }
    else {
     apply(table_data_array2);
     }
if(counter_table_metadata3.h_v == hashvalue3.hash_value3){
    apply(new_table_data_array3);
     }
    else {
     apply(table_data_array3);
     }
    apply(forward);
}

control egress {
    apply(send_frame);
}
