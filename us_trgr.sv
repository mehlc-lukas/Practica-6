module us_trgr(In_clk, In_rst, In_enb, o_mflag);
    input In_clk, In_rst, In_enb;
    output o_mflag;
    
    logic [22:0] ctr;
    
    assign o_mflag = (ctr == 23'd1);
    
    always@(posedge In_rst, posedge In_clk)begin
        if (In_rst)begin
            ctr <= 23'd0;
        end else if(~In_enb | ctr == 23'd6_750_000)begin
            ctr <= 23'd0;    
        end else begin 
            ctr <= ctr + 1'b1;
        end
    end
endmodule

//`timescale 1ns / 1ps
//module trigger(
//    input clk,
//    input rst,
//    input en,
//    output measure
//);
//    reg [22:0] counter;
    
//    // Pulso cuando el contador es 1
//    assign measure = (counter == 23'd1);

//    always @(posedge clk, posedge rst) begin
//        if (rst) begin
//            counter <= 23'd0;
//        end else if (~en | (counter == 23'd6_750_000)) begin
//            counter <= 23'd0;
//        end else begin
//            counter <= counter + 1'b1;
//        end
//    end
//endmodule
