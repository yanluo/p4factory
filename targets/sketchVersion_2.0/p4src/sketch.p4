// This is P4 sample source for sketch
// Fill in these files with your P4 code

#include "includes/headers.p4"
#include "includes/parser.p4"


#define CPU_MIRROR_SESSION_ID        250


/*Counter table metadata */
header_type counter_table_metadata_t {
  fields{     
      h_v1 : 16;
      count1 : 8;
      h_v2 : 16;
      count2 : 8;
      h_v3 : 16;
      count3 : 8;
      h_v4 : 16;
      count4 : 8;
      h_v5 : 16;
      count5 : 8;
      h_min : 16;
      minimum : 8;
      temp : 8;
   
  }
}

header_type mymetadata_t { 
  fields{
      temp1 : 16;
      temp2 : 16;
      temp3 : 16;
      temp4 : 16;
      temp5 : 16;
     }
}

metadata counter_table_metadata_t counter_table_metadata;
metadata mymetadata_t mymetadata;


/* 3 ROWS OF COUNTERS THAT IS DEPTH(d)=3 */
register r1 {
    width : 16;
    instance_count : 1000;   //w=544 //single array of 544 entries   
}

register r2 {
    width : 16;
    instance_count : 1000;   //w=544 //single array of 544 entries   
   
}

register r3 {
    width : 16;
    instance_count : 1000;   //w=544 //single array of 544 entries   
   
}


register r4 {
    width : 16;
    instance_count : 1000;   //w=544 //single array of 544 entries   
   
}

register r5 {
    width : 16;
    instance_count : 1000;   //w=544 //single array of 544 entries   
   
}


register r6 {
   width : 16;
   instance_count : 1000;

}

register r7 {
   width : 16;
   instance_count : 1000;

}

action temp(){
    register_write(r1, counter_table_metadata.h_v1, counter_table_metadata.count1);
    register_write(r2, counter_table_metadata.h_v2, counter_table_metadata.count2);
    register_write(r3, counter_table_metadata.h_v3, counter_table_metadata.count3);
    register_write(r4, counter_table_metadata.h_v4, counter_table_metadata.count4);
    register_write(r5, counter_table_metadata.h_v5, counter_table_metadata.count5);
    modify_field(mymetadata.temp1,counter_table_metadata.h_v1);
    modify_field(mymetadata.temp2,counter_table_metadata.h_v2);
    modify_field(mymetadata.temp3,counter_table_metadata.h_v3);
    modify_field(mymetadata.temp4,counter_table_metadata.h_v4);
    modify_field(mymetadata.temp5,counter_table_metadata.h_v5);
    register_write(r6,counter_table_metadata.h_v1,mymetadata.temp1); 
    register_write(r6,counter_table_metadata.h_v2,mymetadata.temp2);
    register_write(r6,counter_table_metadata.h_v3,mymetadata.temp3);
    register_write(r6,counter_table_metadata.h_v4,mymetadata.temp4);
    register_write(r6,counter_table_metadata.h_v5,mymetadata.temp5);
    register_read(counter_table_metadata.minimum, r7,counter_table_metadata.h_min); 
}


table table_temp{
    actions {
          temp;
      }
 size : 544;
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

table minimum_val4{
      actions{
           min_val4;}
}

table minimum_val5{
      actions{
           min_val5;}
}


table same_minimum_count{
      actions{
           same_minimum;}
}


action  same_minimum(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count1);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

action min_val1(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count1);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

action min_val2(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count2);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

action min_val3(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count3);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

action min_val4(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count4);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

action min_val5(){
    modify_field(counter_table_metadata.minimum, counter_table_metadata.count5);
    register_write(r7,counter_table_metadata.h_min, counter_table_metadata.minimum);
}

table new_table_entry_array{
    actions {
          first_time_count;   
       }
    size : 544;
}

table old_table_entry_array{
    actions { 
	  again_count;
       }
    size : 544;
}

action _drop() {
    drop();
}

action no_op() {
   
}

action first_time_count() {
 	 modify_field(counter_table_metadata.count1, 0x01);  
	 modify_field(counter_table_metadata.count2, 0x01);
	 modify_field(counter_table_metadata.count3, 0x01);
	 modify_field(counter_table_metadata.count4, 0x01);
	 modify_field(counter_table_metadata.count5, 0x01);
         register_write(r7,counter_table_metadata.h_min, 0x01);
}
action again_count(){
	add(counter_table_metadata.count1, counter_table_metadata.count1, 0x01);
	add(counter_table_metadata.count2, counter_table_metadata.count2, 0x01);
        add(counter_table_metadata.count3, counter_table_metadata.count3, 0x01);
        add(counter_table_metadata.count4, counter_table_metadata.count4, 0x01);
        add(counter_table_metadata.count5, counter_table_metadata.count5, 0x01);
        modify_field(counter_table_metadata.temp, 0x08);
        
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
    size: 544;
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
    size: 544;
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
    size: 544;
}

/*-------------------Cloning part-------------------*/

action do_copy_to_cpu() {
    clone_ingress_pkt_to_egress(CPU_MIRROR_SESSION_ID);
}

table copy_to_cpu {
    actions {
           do_copy_to_cpu;
             }
    size : 1;
}


action do_cpu_encap() {
    add_header(cpu_header);
    modify_field(cpu_header.device, 0);
    modify_field(cpu_header.reason, 0xab);
    modify_field(cpu_header.hash1,mymetadata.temp1);
    modify_field(cpu_header.hash2,mymetadata.temp2);
    modify_field(cpu_header.hash3,mymetadata.temp3);
    modify_field(cpu_header.hash4,mymetadata.temp4);
    modify_field(cpu_header.hash5,mymetadata.temp5);
    modify_field(cpu_header.count1,counter_table_metadata.count1);
    modify_field(cpu_header.count2,counter_table_metadata.count2);
    modify_field(cpu_header.count3,counter_table_metadata.count3);
    modify_field(cpu_header.count4,counter_table_metadata.count4);
    modify_field(cpu_header.count5,counter_table_metadata.count5);
    register_read(cpu_header.minimum, r7,counter_table_metadata.h_min);
    modify_field(cpu_header.value,counter_table_metadata.temp);
}

table redirect {
    reads { standard_metadata.instance_type : exact; }
    actions {
              no_op; 
             do_cpu_encap; }
    size : 544;
}
/*--------Special table--------*/
action do_set_myvalue() {
    modify_field_with_hash_based_offset(counter_table_metadata.h_v1,0,ipv4_hash1,1000);
    modify_field_with_hash_based_offset(counter_table_metadata.h_v2,0,ipv4_hash2,1000);
    modify_field_with_hash_based_offset(counter_table_metadata.h_v3,0,ipv4_hash3,1000);
    modify_field_with_hash_based_offset(counter_table_metadata.h_v4,0,ipv4_hash4,1000);
    modify_field_with_hash_based_offset(counter_table_metadata.h_v5,0,ipv4_hash5,1000);
    register_read(counter_table_metadata.count1, r1, counter_table_metadata.h_v1);
    register_read(counter_table_metadata.count2, r2, counter_table_metadata.h_v2);
    register_read(counter_table_metadata.count3, r3, counter_table_metadata.h_v3);
    register_read(counter_table_metadata.count4, r4, counter_table_metadata.h_v4);
    register_read(counter_table_metadata.count5, r5, counter_table_metadata.h_v5);
    register_read(mymetadata.temp1, r6, counter_table_metadata.h_v1);
    register_read(mymetadata.temp2, r6, counter_table_metadata.h_v2);
    register_read(mymetadata.temp3, r6, counter_table_metadata.h_v3);
    register_read(mymetadata.temp3, r6, counter_table_metadata.h_v4);
    register_read(mymetadata.temp3, r6, counter_table_metadata.h_v5);

    
}

table set_myvalue {
    reads { 
    	standard_metadata.instance_type : exact; 
    }
    actions { 
    	no_op;
     	do_set_myvalue; 
     }
    size : 1000;
}

/*----------------------------------------------------*/


/*Control Flow of the program*/
control ingress {  
    apply(ipv4_lpm);
    apply(forward);
    apply(copy_to_cpu);
    
}

control egress {
     apply(set_myvalue);
   if((counter_table_metadata.h_v1==mymetadata.temp1) and (counter_table_metadata.h_v2 == mymetadata.temp2) and (counter_table_metadata.h_v3 == mymetadata.temp3) and (counter_table_metadata.h_v4 == mymetadata.temp4) and (counter_table_metadata.h_v5 == mymetadata.temp5)){ 
    		apply(old_table_entry_array);       		
                if ((counter_table_metadata.count1 < counter_table_metadata.count2) and  (counter_table_metadata.count1 < counter_table_metadata.count3) and (counter_table_metadata.count1 < counter_table_metadata.count4) and (counter_table_metadata.count1 < counter_table_metadata.count5)){
          apply(minimum_val1);}
               if ((counter_table_metadata.count2 < counter_table_metadata.count1) and  (counter_table_metadata.count2 < counter_table_metadata.count3) and (counter_table_metadata.count2 < counter_table_metadata.count4) and (counter_table_metadata.count2 < counter_table_metadata.count5)){
         apply(minimum_val2);}
                if ((counter_table_metadata.count3 < counter_table_metadata.count1) and  (counter_table_metadata.count3 < counter_table_metadata.count2) and (counter_table_metadata.count3 < counter_table_metadata.count4) and (counter_table_metadata.count5 < counter_table_metadata.count5)){
          apply(minimum_val3);}
               if ((counter_table_metadata.count4 < counter_table_metadata.count1) and  (counter_table_metadata.count4 < counter_table_metadata.count2) and (counter_table_metadata.count4 < counter_table_metadata.count3) and (counter_table_metadata.count4 < counter_table_metadata.count5)){
          apply(minimum_val4);}
               if ((counter_table_metadata.count5 < counter_table_metadata.count1) and  (counter_table_metadata.count5 < counter_table_metadata.count2) and (counter_table_metadata.count5 < counter_table_metadata.count3) and (counter_table_metadata.count5 < counter_table_metadata.count4)){
          apply(minimum_val5);}
               if((counter_table_metadata.count1 == counter_table_metadata.count2) and (counter_table_metadata.count2 == counter_table_metadata.count3) and (counter_table_metadata.count3 == counter_table_metadata.count4) and (counter_table_metadata.count4 == counter_table_metadata.count5)){
         apply(same_minimum_count);}
    }
    else {
       
     apply(new_table_entry_array);
 
    }
    apply(table_temp);
    apply(redirect);
    apply(send_frame);
}





