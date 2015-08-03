// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"

/*Counter table metadata for rows, columns and hash value */
header_type counter_table_metadata_t {
  fields{     
      //bucket_index : 10; //w=544 
      //depth_index : 2;  // d=3
      h_v : 16;
   
  }
}


metadata counter_table_metadata_t counter_table_metadata1;
metadata counter_table_metadata_t counter_table_metadata2;
metadata counter_table_metadata_t counter_table_metadata3;


/* 3 ROWS OF COUNTERS THAT IS DEPTH(d)=3 */
counter c1{
    type : packets;
    static : table_data_array1;
    instance_count : 544;   //w=544 //single array of 544 entries   
    saturating ;
}

counter c2{
    type : packets;
    static : table_data_array2;
    instance_count : 544;   //w=544 //single array of 544 entries   
    saturating ;
}

counter c3{
    type : packets;
    static : table_data_array3;
    instance_count : 544;   //w=544 //single array of 544 entries   
    saturating ;
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
	//modify_field(counter_table_metadata1.bucket_index, bucket_index);
	//modify_field(counter_table_metadata1.depth_index, depth_index);
       /*value from hash value metadata is copied to counter table metadata */
	modify_field(counter_table_metadata1.h_v, hashvalue1.hash_value1);
        count(c1,1); //update counter
}

action inc_counter2() {
	//modify_field(counter_table_metadata2.bucket_index, bucket_index);
	//modify_field(counter_table_metadata2.depth_index, depth_index);
 	/*value from hash value metadata is copied to counter table metadata */
	modify_field(counter_table_metadata2.h_v, hashvalue2.hash_value2);
        count(c2,2); //update counter
}

action inc_counter3() {
	//modify_field(counter_table_metadata3.bucket_index, bucket_index);
	//modify_field(counter_table_metadata3.depth_index, depth_index);
 	/*value from hash value metadata is copied to counter table metadata */
	modify_field(counter_table_metadata3.h_v, hashvalue3.hash_value3);
        count(c3,3); //update counter
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
    
   // if(counter_table_metadata1.h_v == hashvalue1.hash_value1){
   //   count(c1,1); //update counter
    //  }
   // if(counter_table_metadata2.h_v == hashvalue2.hash_value2){
   //   count(c2,2); //update counter
    //  }
   // if(counter_table_metadata3.h_v == hashvalue3.hash_value3){
    // count(c3,3); //update counter
   //   }
    apply(forward);
}

control egress {
    apply(send_frame);
}
