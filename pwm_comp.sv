module pwm_comp(In_duty, In_count, O_pwm);
    input logic [3:0]     In_duty;
    input logic [19:0]    In_count;
    
    output logic O_pwm;
    localparam pad_off = 54054;
    localparam pad = 10811; //10811 -6757
    localparam res_min = pad_off/15;
       
    always@(*)begin
        case(In_duty)
            4'b0000:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0001:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0010:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
             4'b0011:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0100:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0101:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0110:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b0111:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b1000:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b1001:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm= 1'b0;
            4'b1010:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            4'b1011:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            4'b1100:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            4'b1101:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            4'b1110:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            4'b1111:
                if(In_count<(pad+(res_min*In_duty)))
                O_pwm = 1'b1; else O_pwm = 1'b0;
            default : O_pwm = 1'b0;
        endcase
    end
     
endmodule