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

field_list_calculation ipv4_hash1 {
    input {
        ipv4_checksum_list;
    }
    algorithm : csum16;
    output_width : 16;
}

field_list_calculation ipv4_hash2 {
    input {
        ipv4_checksum_list;
    }
    algorithm : crc16;
    output_width : 16;
}

field_list_calculation ipv4_hash3 {
    input {
        ipv4_checksum_list;
    }
    algorithm : crc32;
    output_width : 16;
}



calculated_field ipv4.hdrChecksum  {
    verify ipv4_hash1;
    update ipv4_hash1;
    verify ipv4_hash2;
    update ipv4_hash2;
    verify ipv4_hash3;
    update ipv4_hash3;
}



parser parse_ipv4 {
    extract(ipv4);
    return ingress;
}
