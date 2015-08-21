// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"

/*Counter table metadata */
header_type counter_table_metadata_t {
  fields{     
      h_v1 : 10;
      count1 : 10;
      h_v2 : 10;
      count2 : 10;
      h_v3 : 10;
      count3 : 10;
      minimum : 10;
      temp : 10;
   
  }
}


metadata counter_table_metadata_t counter_table_metadata;


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

register flow {
   width : 10;
   direct : table_for_flow_number;
   //instance_count : 10;

}

action temp1(){
    register_write(r1, hashvalue1.hash_value1, counter_table_metadata.count1);
    register_write(r2, hashvalue2.hash_value2, counter_table_metadata.count2);
    register_write(r3, hashvalue3.hash_value3, counter_table_metadata.count3);
    register_read(counter_table_metadata.temp, flow,ipv4.dstAddr);
}

action temp2(){
add(counter_table_metadata.minimum,counter_table_metadata.minimum, counter_table_metadata.temp);
}

action maintain_flow_number() {
   register_write(flow,ipv4.dstAddr,counter_table_metadata.minimum); 
   add_to_field(counter_table_metadata.temp, 0);
}

table table_temp1{
    actions {
          temp1;
      }
 size : 10;
}

table table_temp2{
    actions {
          temp2;
      }
 size : 10;
}


table table_for_flow_number{
    actions {
          maintain_flow_number;
      }
 size : 10;
}


table minimum_val1{
      actions{
           min_val1;}
}

table minimum_val2{
      actions{
           min_val2;}
}

table minimum_val3{
      actions{
           min_val3;}
}


action min_val1(){
    register_write(r1, hashvalue1.hash_value1, counter_table_metadata.count1);
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count1);
}

action min_val2(){
    register_write(r2, hashvalue2.hash_value2, counter_table_metadata.count2);
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count2);
}

action min_val3(){
    register_write(r3, hashvalue3.hash_value3, counter_table_metadata.count3);
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count3);
}

table new_table_entry_array{
     reads {
           ipv4.dstAddr : exact;          
     } 
    actions {
          first_time_count;   
          no_op;
       }
    size : 544;
}

table old_table_entry_array{
     reads {
           ipv4.dstAddr : exact;          
     } 
    actions { 
	  again_count;
          no_op;
       }
    size : 544;
}

action _drop() {
    drop();
}

action no_op() {
   
}


action first_time_count() {
 	modify_field_with_hash_based_offset(counter_table_metadata.h_v1, 0, ipv4_hash1, 545);
	add_to_field(counter_table_metadata.count1, 0x01); //adding 1 to metadata field
	//register_write(r1, hashvalue1.hash_value1, counter_table_metadata.count1);
        modify_field_with_hash_based_offset(counter_table_metadata.h_v2, 0, ipv4_hash2, 545);
	add_to_field(counter_table_metadata.count2, 0x01);
	//register_write(r2, hashvalue2.hash_value2, counter_table_metadata.count2);
	modify_field_with_hash_based_offset(counter_table_metadata.h_v3, 0, ipv4_hash3, 545);
	add_to_field(counter_table_metadata.count3, 0x01);
	//register_write(r3, hashvalue3.hash_value3, counter_table_metadata.count3);
        add_to_field(counter_table_metadata.minimum, 0x01);
}
action again_count(){
	add(counter_table_metadata.count1, counter_table_metadata.count1, 0x01);
	//register_write(r1, hashvalue1.hash_value1, counter_table_metadata.count1);
	add(counter_table_metadata.count2, counter_table_metadata.count2, 0x01);
	//register_write(r2, hashvalue2.hash_value2, counter_table_metadata.count2);
        add(counter_table_metadata.count3, counter_table_metadata.count3, 0x01);
	//register_write(r3, hashvalue3.hash_value3, counter_table_metadata.count3);
        
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
    register_read(counter_table_metadata.count1, r1, hashvalue1.hash_value1);
    register_read(counter_table_metadata.count2, r2, hashvalue2.hash_value2);
    register_read(counter_table_metadata.count3, r3, hashvalue3.hash_value3);
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


/*Control Flow of the program*/
control ingress {
    apply(ipv4_lpm);
    if((counter_table_metadata.h_v1 == hashvalue1.hash_value1) or (counter_table_metadata.h_v2 == hashvalue2.hash_value2) or (counter_table_metadata.h_v3 == hashvalue3.hash_value3)) {
    		apply(old_table_entry_array);
       		if ((counter_table_metadata.count1 < counter_table_metadata.count2) and     (counter_table_metadata.count1 < counter_table_metadata.count3)){
         apply(minimum_val1);}
      		if ((counter_table_metadata.count2 < counter_table_metadata.count3) and      		(counter_table_metadata.count2 < counter_table_metadata.count1)){
         apply(minimum_val2);}
		else {
         apply(minimum_val3);}
    }
    else {
         apply(new_table_entry_array);
     }
   apply(table_temp1);
   apply(table_temp2);
   apply(table_for_flow_number);
   apply(forward);
}

control egress {
    apply(send_frame);
}
