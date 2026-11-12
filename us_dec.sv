typedef struct packed {
    logic [3:0] uni;
    logic [3:0] dec;
    logic [3:0] cen;
    logic [3:0] tho;
} bcd_t;

module us_dec(In_val, o_dat);
    input logic [9:0] In_val;
    output bcd_t o_dat;
    
    always@(*) begin
        o_dat.uni = 4'd0;    
        o_dat.dec = 4'd0;    
        o_dat.cen = 4'd0;    
        o_dat.tho = 4'd0;
            
        if(o_dat.uni >=5) o_dat.uni = o_dat.uni + 3;
        if(o_dat.dec >=5) o_dat.dec = o_dat.dec + 3;
        if(o_dat.cen >=5) o_dat.cen = o_dat.cen + 3;
        if(o_dat.tho >=5) o_dat.tho = o_dat.tho + 3;    
    end
endmodule