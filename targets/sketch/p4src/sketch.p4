// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"



header_type register_table_metadata_t {
  fields{
      hash_value : 9;
      bucket_index : 10; //w=544 
      depth_index : 2;  // d=3
   
  }
}

metadata register_table_metadata_t register_table_metadata1;
metadata register_table_metadata_t register_table_metadata2;
metadata register_table_metadata_t register_table_metadata3;


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

action inc_counter1(hash_value,bucket_index,depth_index,port) {
	//set_field_to_hash_index(register_table_metadata1.hash_value, hash_value, 0, 544);//here i want to set calculated hash value into metadata of table
	modify_field(register_table_metadata1.bucket_index, bucket_index);
	modify_field(register_table_metadata1.depth_index, depth_index);
        modify_field(standard_metadata.egress_spec, port);
        count(c1,1);
      	//add_to_field(ipv4.ttl, -1);
}

action inc_counter2(hash_value, bucket_index,depth_index,port) {
	//set_field_to_hash_index(register_table_metadata2.hash_value, hash_value, 0, 544);
	modify_field(register_table_metadata2.bucket_index, bucket_index);
	modify_field(register_table_metadata2.depth_index, depth_index);
        count(c2,1);
	modify_field(standard_metadata.egress_spec, port);
	//add_to_field(ipv4.ttl, -1);
}

action inc_counter3(hash_value, bucket_index,depth_index,port) {
	//set_field_to_hash_index(register_table_metadata3.hash_value, hash_value, 0, 544); 
	modify_field(register_table_metadata3.bucket_index, bucket_index);
	modify_field(register_table_metadata3.depth_index, depth_index);
        count(c3,1);
	modify_field(standard_metadata.egress_spec, port);
	//add_to_field(ipv4.ttl, -1);
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


action rewrite_mac(smac) {
    modify_field(ethernet.srcAddr, smac);
}

control ingress {
if(register_table_metadata1.hash_value==ipv4.hdrChecksum){
    apply(table_data_array1);
   }
if(register_table_metadata2.hash_value==ipv4.hdrChecksum){
    apply(table_data_array2); 
   }
if (register_table_metadata3.hash_value==ipv4.hdrChecksum){
    apply(table_data_array3);
  }
}

control egress {
    apply(send_frame);
}
