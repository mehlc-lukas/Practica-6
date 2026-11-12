module pwm_reset(In_ctr, O_rst);
    input logic [19:0] In_ctr;
    output logic O_rst;
    
    assign O_rst = (In_ctr >= 20'd540541)?1'b1:1'b0;
endmodule