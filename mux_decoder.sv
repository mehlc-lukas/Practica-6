module mux_decoder(In_rst,In_clk,data_uni,data_dec,data_cent,data_thou,o_data);
    input   In_rst, In_clk;
    input   [3:0] data_uni, data_dec, data_cent, data_thou;
    output  reg [3:0] o_data;
    
    reg [2:0] ctr;
    always@(posedge In_rst, posedge In_clk)begin
            if(In_rst)ctr<=3'd0;
            else begin
            case(ctr)
                2'b00: o_data = data_uni;
                2'b01: o_data = data_dec;
                2'b10: o_data = data_cent;
                2'b11: o_data = data_thou;
            endcase
            ctr <= (ctr == 3'd4)? 2'd0: ctr+1;
            end
    end
endmodule