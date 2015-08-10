// Template parser.p4 file for sketch
// Edit this file as needed for your P4 program

// This parses an ethernet header

parser start {
    return parse_ethernet;
}

#define ETHERTYPE_IPV4 0x0800

header ethernet_t ethernet;

parser parse_ethernet {
    extract(ethernet);
    return select(latest.etherType) {
        ETHERTYPE_IPV4 : parse_ipv4;
        default: ingress;
    }
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

/*1st hash value calculation */
field_list_calculation ipv4_hash1 {
    input {
        ipv4_checksum_list;
    }
    algorithm : csum16; //1st algo
    output_width : 32;
}

/*2nd hash value calculation */
field_list_calculation ipv4_hash2 {
    input {
        ipv4_checksum_list;
    }
    algorithm : crc16;  //2nd algo
    output_width : 32;
}

/*3rd hash value calculation */
field_list_calculation ipv4_hash3 {
    input {
        ipv4_checksum_list;
    }
    algorithm : crc32; //3rd algo
    output_width : 32;
}

metadata hashvalue1_t hashvalue1;
metadata hashvalue2_t hashvalue2;
metadata hashvalue3_t hashvalue3;

/*Calculated 1st hash value updated in hash value metadata1*/
calculated_field hashvalue1.hash_value1  {
    verify ipv4_hash1;
    update ipv4_hash1;
}

/*Calculated 2nd hash value updated in hash value metadata2*/
calculated_field hashvalue2.hash_value2  {
    verify ipv4_hash2;
    update ipv4_hash2;
}

/*Calculated 3rd hash value updated in hash value metadata3*/
calculated_field hashvalue3.hash_value3  {
    verify ipv4_hash3;
    update ipv4_hash3;
}


parser parse_ipv4 {
    extract(ipv4);
    return ingress;
}
