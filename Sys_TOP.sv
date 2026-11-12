module Sys_TOP(In_rst,In_clk,In_duty,O_pwm, disp_thou, disp_cent, disp_dec, disp_uni, a,b,c,d,e,f,g);
    input logic In_clk, In_rst; //In_lock;
    input  logic [3:0] In_duty;
    output logic O_pwm; 
    output a,b,c,d,e,f,g, disp_dec, disp_uni, disp_cent, disp_thou;
    
    //Wire declarations
    logic [19:0] data;
    logic w_pwm_rst, w_or_rst;
    
    logic [3:0] display_val, data_thou, data_cent, data_dec, data_uni;
        
    ctr19 m0(
        .In_clk(In_clk),
        .In_rst(w_or_rst),
        .O_ctr(data)
    );
    
    pwm_reset m1(
        .In_ctr(data),
        .O_rst(w_pwm_rst)
    );
    
    pwm_comp m2(
        .In_duty(In_duty),
        .In_count(data),
        .O_pwm(O_pwm)
    );
    
    or_module m3(
        .out(w_or_rst),
        .In_A(w_pwm_rst),
        .In_B(In_rst)
    );
    
    num_dec m4(
        .In_duty(In_duty),
        .uni(data_uni),
        .dec(data_dec),
        .cent(data_cent), 
        .thou(data_thou)
    );

    mux_decoder m5(
        .o_data(display_val),
        .In_clk(In_clk),
        .In_rst(In_rst),
        .data_uni(data_uni),
        .data_dec(data_dec),
        .data_cent(data_cent),
        .data_thou(data_thou)
    );
    
    decoder m6(
        .val(display_val),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );
    
    mux_display m7(
        .In_rst(In_rst),
        .In_clk(In_clk),
        .o_disp_uni(disp_uni), 
        .o_disp_dec(disp_dec),
        .o_disp_cent(disp_cent),
        .o_disp_thou(disp_thou)
    );
endmodule