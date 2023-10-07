module hermitian(
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
    output reg signed [23:0]      y0_real,
    output reg signed [23:0]      y0_imag,
    output reg signed [23:0]      y1_real,
    output reg signed [23:0]      y1_imag,
    output reg signed [23:0]      y2_real,
    output reg signed [23:0]      y2_imag,
    output reg signed [23:0]      y3_real,
    output reg signed [23:0]      y3_imag,
    output reg signed [23:0]      y4_real,
    output reg signed [23:0]      y4_imag,
    output reg signed [23:0]      y5_real,
    output reg signed [23:0]      y5_imag,
    output reg signed [23:0]      y6_real,
    output reg signed [23:0]      y6_imag,
    output reg signed [23:0]      y7_real,
    output reg signed [23:0]      y7_imag,
    
    output reg valid );

    always @(posedge clk or negedge reset) begin

    if (!reset) begin
        y0_real=0;
        y0_imag=0;
        y1_real=0;
        y1_imag=0;
        y2_real=0;
        y2_imag=0;
        y3_real=0;
        y3_imag=0;
        y4_real=0;
        y4_imag=0;
        y5_real=0;
        y5_imag=0;
        y6_real=0;
        y6_imag=0;
        y7_real=0;
        y7_imag=0;
        valid=0;
        end

    if(en) begin
        
        y0_real=x0_real;
        y0_imag=(-1'd1)*x0_imag;
        y1_real=x1_real;
        y1_imag=(-1'd1)*x1_imag;
        y2_real=x2_real;
        y2_imag=(-1'd1)*x2_imag;
        y3_real=x3_real;
        y3_imag=(-1'd1)*x3_imag;
        y4_real=x4_real;
        y4_imag=(-1'd1)*x4_imag;
        y5_real=x5_real;
        y5_imag=(-1'd1)*x5_imag;
        y6_real=x6_real;
        y6_imag=(-1'd1)*x6_imag;
        y7_real=x7_real;
        y7_imag=(-1'd1)*x7_imag;
        valid=1;
        
    end
    else begin
        valid=0;
    end

        

    end






endmodule