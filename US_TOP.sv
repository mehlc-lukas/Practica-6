
module US_TOP(In_rst, In_clk, In_echo, In_enb, o_trg, disp_thou, disp_cent, disp_dec, disp_uni, a,b,c,d,e,f,g);
    input logic In_clk, In_rst; //In_lock;
    input  logic In_echo, In_enb;
    output logic o_trg; 
    output a,b,c,d,e,f,g, disp_dec, disp_uni, disp_cent, disp_thou;
    
    //Wire declarations
    logic w_flag;
    logic [3:0] w_disp;
    logic [9:0] w_dist;
    bcd_t data;
        
    us_trgr m0(
        .In_clk(In_clk),
        .In_rst(In_rst),
        .In_enb(In_enb),
        .o_mflag(w_flag)
    );
    
    us_s m1(
        .In_clk(In_clk),
        .In_rst(In_rst),
        .In_mflag(w_flag),
        .In_echo(In_echo),
        .o_trgr(o_trg),
        .o_dist(w_dist)
     );

    
    us_dec m4(
        .In_val(w_dist),
        .o_dat(data)
    );

    mux_decoder m5(
        .o_data(w_disp),
        .In_clk(In_clk),
        .In_rst(In_rst),
        .data_uni(data.uni),
        .data_dec(data.dec),
        .data_cent(data.cen),
        .data_thou(data.tho)
    );
    
    decoder m6(
        .val(w_disp),
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