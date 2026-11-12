module num_dec(In_duty, uni, dec, cent, thou);
    input logic [3:0] In_duty;
    output logic[3:0] uni;
    output logic[3:0] dec;
    output logic[3:0] cent;
    output logic[3:0] thou;
    
    always@(*)begin
        case(In_duty)
            4'd0:     {thou,cent,dec,uni} = 11'h0000;
            4'd1:     {thou,cent,dec,uni} = 11'h0012;
            4'd2:     {thou,cent,dec,uni} = 11'h0024;
            4'd3:     {thou,cent,dec,uni} = 11'h0036;
            4'd4:     {thou,cent,dec,uni} = 11'h0048;
            4'd5:     {thou,cent,dec,uni} = 11'h0060;
            4'd6:     {thou,cent,dec,uni} = 11'h0072;
            4'd7:     {thou,cent,dec,uni} = 11'h0084;
            4'd8:     {thou,cent,dec,uni} = 11'h0096;
            4'd9:     {thou,cent,dec,uni} = 11'h0108;
            4'd10:    {thou,cent,dec,uni} = 11'h0120;
            4'd11:    {thou,cent,dec,uni} = 11'h0132;
            4'd12:    {thou,cent,dec,uni} = 11'h0144;
            4'd13:    {thou,cent,dec,uni} = 11'h0156;
            4'd14:    {thou,cent,dec,uni} = 11'h0168;
            4'd15:    {thou,cent,dec,uni} = 11'h0180;
            default:  {thou,cent,dec,uni} = 11'h0000;
        endcase
    end
endmodule
