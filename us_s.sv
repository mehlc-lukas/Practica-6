module us_s(In_clk, In_rst, In_mflag, In_echo, o_trgr, o_dist);
    input In_clk, In_rst, In_mflag, In_echo;
    
    output logic o_trgr;
    output logic [9:0] o_dist;
    
    localparam IDLE     = 2'd0,
               TRGR     = 2'd1,
               C_ECHO   = 2'd2,
               W_ECHO   = 2'd3;
    
    logic [1:0]  state;
    logic [8:0]  trgr_ctr;
    logic [10:0] dist_ctr;
    
    always@(posedge In_rst, posedge In_clk)begin
        if(In_rst)begin
            state <= IDLE;
            o_trgr <= 1'b0;
            trgr_ctr <= 9'd0;
            dist_ctr <= 11'd0;
            o_dist <= 10'd0;
        end else begin
            case(state)
                IDLE:begin
                    o_trgr <= 1'b0;
                    if(In_mflag)begin
                        state <= TRGR;
                        trgr_ctr <= 9'd0;
                        o_dist <= 10'd0;
                    end
                end
                TRGR:begin
                    o_trgr <= 1'b1;
                    if(trgr_ctr == 9'd270)begin
                        state <= W_ECHO;
                        o_trgr <= 1'b0; 
                    end else begin 
                        trgr_ctr <= trgr_ctr +1;
                    end
                end
                W_ECHO:begin
                    dist_ctr <= 11'd0;
                    if(In_echo) state <= C_ECHO;
                end
                C_ECHO:begin
                    if(In_echo)begin
                        if(dist_ctr == 11'd1565)begin
                            dist_ctr <= 11'd0;
                            o_dist <= o_dist +1;
                        end else begin 
                            dist_ctr <= dist_ctr +1;
                        end
                    end else begin 
                        state <= IDLE;
                    end
                end        
            endcase
        end
    end  
endmodule

//module sensor (
//    input clk,
//    input rst,
//    input measure,
//    input logic echo,
//    output reg trig,
//    output ready,
//    output reg [9:0] distance_cm
//);
//    localparam IDLE       = 2'b00, 
//               TRIGGER    = 2'b01, 
//               WAIT_ECHO  = 2'b11, 
//               COUNT_ECHO = 2'b10;

//    reg [1:0] state;
//    reg [8:0] trig_counter; // Contador para 270 ciclos (10 us)
//    reg [10:0] cm_counter;  // Contador para 1566 ciclos (58 us = 1 cm)

//    assign ready = (state == IDLE);

//    always @(posedge clk, posedge rst) begin
//        if (rst) begin
//            state <= IDLE;
//            trig <= 0;
//            trig_counter <= 0;
//            cm_counter <= 0;
//            distance_cm <= 0;
//        end else begin
//            case (state)
//                IDLE: begin
//                    trig <= 0;
//                    if (measure) begin
//                        state <= TRIGGER;
//                        trig_counter <= 0;
//                        distance_cm <= 0;
//                    end
//                end
//                TRIGGER: begin
//                    trig <= 1;
//                    if (trig_counter == 9'd270) begin 
//                        state <= WAIT_ECHO;
//                        trig <= 0;
//                    end else begin
//                        trig_counter <= trig_counter + 1;
//                    end
//                end
//                WAIT_ECHO: begin
//                    cm_counter <= 0;
//                    if (echo) state <= COUNT_ECHO;
//                end
//                COUNT_ECHO: begin
//                    if (echo) begin
//                        if (cm_counter == 11'd1565) begin 
//                            cm_counter <= 0;
//                            distance_cm <= distance_cm + 1;
//                        end else begin
//                            cm_counter <= cm_counter + 1;
//                        end
//                    end else begin
//                        state <= IDLE;
//                    end
//                end
//            endcase
            
//        end
//    end
//endmodule