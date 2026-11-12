module ctr19(In_rst, In_clk, O_ctr);
    input In_rst, In_clk;
    output logic [19:0] O_ctr;
    
    always@(posedge In_rst, posedge In_clk)begin
        if(In_rst) O_ctr <= 0; else
        O_ctr <= O_ctr+1;
    end
endmodule