// Template parser.p4 file for sketch
// Edit this file as needed for your P4 program
// This parses an ethernet header

parser start {
    return select(current(0, 64)) {
        0 : parse_cpu_header;
        default: parse_ethernet;
    }
}

/*parser start {
    return parse_ethernet;
}*/

#define ETHERTYPE_IPV4 0x0800

header ethernet_t ethernet;

parser parse_ethernet {
    extract(ethernet);
    return select(latest.etherType) {
        ETHERTYPE_IPV4 : parse_ipv4;
        default: ingress;
    }
}

parser parse_cpu_header {
    extract(cpu_header);
    return parse_ethernet;
}

header ipv4_t ipv4;

/* Fields to take for calculating hash value*/
field_list ipv4_checksum_list {
        ipv4.version;
        ipv4.ihl;
        ipv4.diffserv;
        ipv4.totalLen;
        ipv4.identification;
        ipv4.flags;
        ipv4.fragOffset;
        ipv4.ttl;
        ipv4.protocol;
        ipv4.srcAddr;
        ipv4.dstAddr;
}

field_list_calculation ipv4_checksum {
    input {
        ipv4_checksum_list;
    }
    algorithm : csum16;
    output_width : 16;
}

calculated_field ipv4.hdrChecksum  {
    verify ipv4_checksum;
    update ipv4_checksum;
}

field_list hashvalue_list1 {
        ipv4.srcAddr;
        ipv4.dstAddr;
}

field_list hashvalue_list2 {
        ipv4.srcAddr;
        ipv4.dstAddr;
        ipv4.version;
        ipv4.ihl;
        ipv4.diffserv;
        ipv4.totalLen;
        ipv4.protocol;      
}

field_list hashvalue_list3 {
        ipv4.srcAddr;
        ipv4.dstAddr;
        ipv4.version;
        ipv4.ihl;
        ipv4.diffserv;     
}



/*1st hash value calculation */
field_list_calculation ipv4_hash1 {
    input {
        hashvalue_list1;
    }
    algorithm : csum16; //1st algo
    output_width : 16;
}

/*2nd hash value calculation */
field_list_calculation ipv4_hash2 {
    input {
        hashvalue_list2;
    }
    algorithm : xor16;  //2nd algo
    output_width : 16;
}

/*3rd hash value calculation */
field_list_calculation ipv4_hash3 {
    input {
        hashvalue_list3;
    }
    algorithm : xor16; 
    output_width : 16;
}

/*4th hash value calculation */
field_list_calculation ipv4_hash4 {
    input {
        hashvalue_list1;
    }
    algorithm : xor16; 
    output_width : 16;
}

/*5th hash value calculation */
field_list_calculation ipv4_hash5 {
    input {
        hashvalue_list2;
    }
    algorithm : csum16; 
    output_width : 16;
}

parser parse_ipv4 {
    extract(ipv4);
    return ingress;
}
