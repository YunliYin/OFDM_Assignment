module demodem (
    //ports
    input clk,reset,en,
    input signed [23:0]      x0_real,
    input signed [23:0]      x0_imag,
    input signed [23:0]      x1_real,
    input signed [23:0]      x1_imag,
    input signed [23:0]      x2_real,
    input signed [23:0]      x2_imag,
    input signed [23:0]      x3_real,
    input signed [23:0]      x3_imag,
    input signed [23:0]      x4_real,
    input signed [23:0]      x4_imag,
    input signed [23:0]      x5_real,
    input signed [23:0]      x5_imag,
    input signed [23:0]      x6_real,
    input signed [23:0]      x6_imag,
    input signed [23:0]      x7_real,
    input signed [23:0]      x7_imag,
    output out_x,
    output out_y,
    output sig);

    
    reg  temp_x,temp_y;
    reg  [2:0] count;
    reg flag;

    assign out_x=temp_x;
    assign out_y=temp_y;
    assign sig=flag;


    always @(posedge clk or negedge reset) begin

    if (!reset) begin
        temp_x<=0;
        temp_y<=0;
        flag=0;
        count=0;
    end

    else if (count==3'd7) begin
        count = 1'd0;
         end
    else begin
            count = count + 1'd1;
    end

    if (en) begin
        count=0;
    end
    if (count==0) flag=1;
    else flag=0;


    case(count)
        3'd1:  begin
                    if (x0_real<0&&x0_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x0_real>0&&x0_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x0_real<0&&x0_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x0_real>0&&x0_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end
        3'd2:  begin
                    if (x1_real<0&&x1_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x1_real>0&&x1_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x1_real<0&&x1_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x1_real>0&&x1_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end
        3'd3:  begin
                    if (x2_real<0&&x2_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x2_real>0&&x2_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x2_real<0&&x2_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x2_real>0&&x2_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end
        3'd4:  begin
                    if (x3_real<0&&x3_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x3_real>0&&x3_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x3_real<0&&x3_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x3_real>0&&x3_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end

        3'd5:  begin
                    if (x4_real<0&&x4_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x4_real>0&&x4_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x4_real<0&&x4_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x4_real>0&&x4_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end

        3'd6:  begin
                    if (x5_real<0&&x5_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=1;
                                                        end 
                    if (x5_real>0&&x5_imag>0) begin
                                                            temp_x=0;
                                                            temp_y=0;
                                                        end 
                    if (x5_real<0&&x5_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=0;
                                                        end 
                    if (x5_real>0&&x5_imag<0) begin
                                                            temp_x=1;
                                                            temp_y=1;
                                                        end                                                                         
                end
        
        3'd7:  begin
            if (x6_real<0&&x6_imag>0) begin
                                                    temp_x=0;
                                                    temp_y=1;
                                                end 
            if (x6_real>0&&x6_imag>0) begin
                                                    temp_x=0;
                                                    temp_y=0;
                                                end 
            if (x6_real<0&&x6_imag<0) begin
                                                    temp_x=1;
                                                    temp_y=0;
                                                end 
            if (x6_real>0&&x6_imag<0) begin
                                                    temp_x=1;
                                                    temp_y=1;
                                                end                                                                         
        end
        3'd0:  begin
            if (x7_real<0&&x7_imag>0) begin
                                                    temp_x=0;
                                                    temp_y=1;
                                                end 
            if (x7_real>0&&x7_imag>0) begin
                                                    temp_x=0;
                                                    temp_y=0;
                                                end 
            if (x7_real<0&&x7_imag<0) begin
                                                    temp_x=1;
                                                    temp_y=0;
                                                end 
            if (x7_real>0&&x7_imag<0) begin
                                                    temp_x=1;
                                                    temp_y=1;
                                                end                                                                         
        end
    endcase


    end





    
endmodule
