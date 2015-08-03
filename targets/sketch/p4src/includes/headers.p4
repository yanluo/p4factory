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


/*Metadata for 1st hash value*/  
header_type hashvalue1_t {
    fields {
        hash_value1 : 16;
    }
}

/*Metadata for 2nd hash value */ 
header_type hashvalue2_t {
    fields {
        hash_value2 : 16;
    }
}

/*Metadata for 3rd hash value */ 
header_type hashvalue3_t {
    fields {
        hash_value3 : 16;
    }
}

