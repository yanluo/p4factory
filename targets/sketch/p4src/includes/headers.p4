// Template headers.p4 file for sketch
// Edit this file as needed for your P4 program

// Here's an ethernet header to get started.

header_type ethernet_t {
    fields {
        dstAddr : 48;
        srcAddr : 48;
        etherType : 16;
    }
}

header_type ipv4_t {
    fields {
        version : 4;
        ihl : 4;
        diffserv : 8;
        totalLen : 16;
        identification : 16;
        flags : 3;
        fragOffset : 13;
        ttl : 8;
        protocol : 8;
        hdrChecksum : 16;
        srcAddr : 32;
        dstAddr: 32;
    }
}

header_type intrinsic_metadata_t {
    fields {
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        lf_field_list: 32;
    }
}

header_type cpu_header_t {
    fields {
        device: 8;
        reason: 8;
        hash1 : 16;
        hash2 : 16;
        hash3 : 16;
        count1 : 8; 
        count2 : 8; 
        count3 : 8; 
        minimum : 8;
        value : 8;
    }
}

header cpu_header_t cpu_header;
metadata intrinsic_metadata_t intrinsic_metadata;


