`timescale 1ns/1ps
module Caifft_tb;
    reg clk;
    reg reset;
    reg in;
    wire[7:0] outc;
    wire sig;
    wire [23:0] out_x;
    wire [23:0] out_y;
    //ifft fft
    wire signed [23:0]      x0_real;
    wire signed [23:0]      x0_imag;
    wire signed [23:0]      x1_real;
    wire signed [23:0]      x1_imag;
    wire signed [23:0]      x2_real;
    wire signed [23:0]      x2_imag;
    wire signed [23:0]      x3_real;
    wire signed [23:0]      x3_imag;
    wire signed [23:0]      x4_real;
    wire signed [23:0]      x4_imag;
    wire signed [23:0]      x5_real;
    wire signed [23:0]      x5_imag;
    wire signed [23:0]      x6_real;
    wire signed [23:0]      x6_imag;
    wire signed [23:0]      x7_real;
    wire signed [23:0]      x7_imag;
    wire signed [23:0]      y0_real;
    wire signed [23:0]      y0_imag;
    wire signed [23:0]      y1_real;
    wire signed [23:0]      y1_imag;
    wire signed [23:0]      y2_real;
    wire signed [23:0]      y2_imag;
    wire signed [23:0]      y3_real;
    wire signed [23:0]      y3_imag;
    wire signed [23:0]      y4_real;
    wire signed [23:0]      y4_imag;
    wire signed [23:0]      y5_real;
    wire signed [23:0]      y5_imag;
    wire signed [23:0]      y6_real;
    wire signed [23:0]      y6_imag;
    wire signed [23:0]      y7_real;
    wire signed [23:0]      y7_imag;
    wire signed [23:0]      z0_real;
    wire signed [23:0]      z0_imag;
    wire signed [23:0]      z1_real;
    wire signed [23:0]      z1_imag;
    wire signed [23:0]      z2_real;
    wire signed [23:0]      z2_imag;
    wire signed [23:0]      z3_real;
    wire signed [23:0]      z3_imag;
    wire signed [23:0]      z4_real;
    wire signed [23:0]      z4_imag;
    wire signed [23:0]      z5_real;
    wire signed [23:0]      z5_imag;
    wire signed [23:0]      z6_real;
    wire signed [23:0]      z6_imag;
    wire signed [23:0]      z7_real;
    wire signed [23:0]      z7_imag;



    wire signed [23:0]      p0_real;
    wire signed [23:0]      p0_imag;
    wire signed [23:0]      p1_real;
    wire signed [23:0]      p1_imag;
    wire signed [23:0]      p2_real;
    wire signed [23:0]      p2_imag;
    wire signed [23:0]      p3_real;
    wire signed [23:0]      p3_imag;
    wire signed [23:0]      p4_real;
    wire signed [23:0]      p4_imag;
    wire signed [23:0]      p5_real;
    wire signed [23:0]      p5_imag;
    wire signed [23:0]      p6_real;
    wire signed [23:0]      p6_imag;
    wire signed [23:0]      p7_real;
    wire signed [23:0]      p7_imag;
    wire signed [23:0]      q0_real;
    wire signed [23:0]      q0_imag;
    wire signed [23:0]      q1_real;
    wire signed [23:0]      q1_imag;
    wire signed [23:0]      q2_real;
    wire signed [23:0]      q2_imag;
    wire signed [23:0]      q3_real;
    wire signed [23:0]      q3_imag;
    wire signed [23:0]      q4_real;
    wire signed [23:0]      q4_imag;
    wire signed [23:0]      q5_real;
    wire signed [23:0]      q5_imag;
    wire signed [23:0]      q6_real;
    wire signed [23:0]      q6_imag;
    wire signed [23:0]      q7_real;
    wire signed [23:0]      q7_imag;
    
    wire valid_datastall;
    wire valid_hermiiff1;
    wire valid_hermiiff2;
    wire valid_hermiiff3;
    wire valid_fft;
    //
    wire demodem_outx;
    wire demodem_outy;
    wire sig_deout;
    wire finout;
    wire flag;
    wire sig_m;
    reg [2:0] count;


    //generate clock
    real         CYCLE_200MHz = 5 ; //
    always begin
        clk = 0 ; #(CYCLE_200MHz/2) ;
        clk = 1 ; #(CYCLE_200MHz/2) ;
    end

    //generate reset
    initial begin
        reset     = 1'b0 ;
        #5 reset      = 1'b1 ;
    end

    //motivation
    initial begin
        in = 0;
    end


   
    //model instantiation

    Coder coder1(
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(outc),
        .sig(sig)
    );

    Modem modem1(
        .clk(clk),
        .reset(reset),
        .in(outc),
        .en(sig),
        .out_x(out_x),
        .out_y(out_y),
        .sig(sig_m)
    );

    datastall datastall1(
        .clk        (clk    ),
        .reset      (reset  ),
        .en         (sig_m    ),
        .in_x    (out_x),
        .in_y    (out_y),

        .valid      (valid_datastall),
        .x0_real    (x0_real),
        .x0_imag    (x0_imag),
        .x1_real    (x1_real),
        .x1_imag    (x1_imag),
        .x2_real    (x2_real),
        .x2_imag    (x2_imag),
        .x3_real    (x3_real),
        .x3_imag    (x3_imag),
        .x4_real    (x4_real),
        .x4_imag    (x4_imag),
        .x5_real    (x5_real),
        .x5_imag    (x5_imag),
        .x6_real    (x6_real),
        .x6_imag    (x6_imag),
        .x7_real    (x7_real),
        .x7_imag    (x7_imag)
    );

    //ifft

    hermitian hermitian1(
    
    .clk        (clk    ),
    .reset       (reset),
    .en         (valid_datastall),
    .x0_real    (x0_real),
    .x0_imag    (x0_imag),
    .x1_real    (x1_real),
    .x1_imag    (x1_imag),
    .x2_real    (x2_real),
    .x2_imag    (x2_imag),
    .x3_real    (x3_real),
    .x3_imag    (x3_imag),
    .x4_real    (x4_real),
    .x4_imag    (x4_imag),
    .x5_real    (x5_real),
    .x5_imag    (x5_imag),
    .x6_real    (x6_real),
    .x6_imag    (x6_imag),
    .x7_real    (x7_real),
    .x7_imag    (x7_imag),

    .valid      (valid_hermiiff1),
    .y0_real    (y0_real),
    .y0_imag    (y0_imag),
    .y1_real    (y1_real),
    .y1_imag    (y1_imag),
    .y2_real    (y2_real),
    .y2_imag    (y2_imag),
    .y3_real    (y3_real),
    .y3_imag    (y3_imag),
    .y4_real    (y4_real),
    .y4_imag    (y4_imag),
    .y5_real    (y5_real),
    .y5_imag    (y5_imag),
    .y6_real    (y6_real),
    .y6_imag    (y6_imag),
    .y7_real    (y7_real),
    .y7_imag    (y7_imag)



    );

    fft8 ifft(
        .clk        (clk    ),
        .rstn       (reset    ),
        .en         (valid_hermiiff1     ),
        .x0_real    (y0_real),
        .x0_imag    (y0_imag),
        .x1_real    (y1_real),
        .x1_imag    (y1_imag),
        .x2_real    (y2_real),
        .x2_imag    (y2_imag),
        .x3_real    (y3_real),
        .x3_imag    (y3_imag),
        .x4_real    (y4_real),
        .x4_imag    (y4_imag),
        .x5_real    (y5_real),
        .x5_imag    (y5_imag),
        .x6_real    (y6_real),
        .x6_imag    (y6_imag),
        .x7_real    (y7_real),
        .x7_imag    (y7_imag),

        .valid      (valid_hermiiff2),
        .y0_real    (z0_real),
        .y0_imag    (z0_imag),
        .y1_real    (z1_real),
        .y1_imag    (z1_imag),
        .y2_real    (z2_real),
        .y2_imag    (z2_imag),
        .y3_real    (z3_real),
        .y3_imag    (z3_imag),
        .y4_real    (z4_real),
        .y4_imag    (z4_imag),
        .y5_real    (z5_real),
        .y5_imag    (z5_imag),
        .y6_real    (z6_real),
        .y6_imag    (z6_imag),
        .y7_real    (z7_real),
        .y7_imag    (z7_imag)



    );

    hermitian hermitian2(
    .clk        (clk    ),
    .reset      (reset),
    .en         (valid_hermiiff2),
    .x0_real    (z0_real),
    .x0_imag    (z0_imag),
    .x1_real    (z1_real),
    .x1_imag    (z1_imag),
    .x2_real    (z2_real),
    .x2_imag    (z2_imag),
    .x3_real    (z3_real),
    .x3_imag    (z3_imag),
    .x4_real    (z4_real),
    .x4_imag    (z4_imag),
    .x5_real    (z5_real),
    .x5_imag    (z5_imag),
    .x6_real    (z6_real),
    .x6_imag    (z6_imag),
    .x7_real    (z7_real),
    .x7_imag    (z7_imag),

    .valid      (valid_hermiiff3),
    .y0_real    (p0_real),
    .y0_imag    (p0_imag),
    .y1_real    (p1_real),
    .y1_imag    (p1_imag),
    .y2_real    (p2_real),
    .y2_imag    (p2_imag),
    .y3_real    (p3_real),
    .y3_imag    (p3_imag),
    .y4_real    (p4_real),
    .y4_imag    (p4_imag),
    .y5_real    (p5_real),
    .y5_imag    (p5_imag),
    .y6_real    (p6_real),
    .y6_imag    (p6_imag),
    .y7_real    (p7_real),
    .y7_imag    (p7_imag)

    );
    //fft
    fft8 fft(
        .clk        (clk    ),
        .rstn       (reset    ),
        .en         (valid_hermiiff3     ),
        .x0_real    (p0_real),
        .x0_imag    (p0_imag),
        .x1_real    (p1_real),
        .x1_imag    (p1_imag),
        .x2_real    (p2_real),
        .x2_imag    (p2_imag),
        .x3_real    (p3_real),
        .x3_imag    (p3_imag),
        .x4_real    (p4_real),
        .x4_imag    (p4_imag),
        .x5_real    (p5_real),
        .x5_imag    (p5_imag),
        .x6_real    (p6_real),
        .x6_imag    (p6_imag),
        .x7_real    (p7_real),
        .x7_imag    (p7_imag),

        .valid      (valid_fft),
        .y0_real    (q0_real),
        .y0_imag    (q0_imag),
        .y1_real    (q1_real),
        .y1_imag    (q1_imag),
        .y2_real    (q2_real),
        .y2_imag    (q2_imag),
        .y3_real    (q3_real),
        .y3_imag    (q3_imag),
        .y4_real    (q4_real),
        .y4_imag    (q4_imag),
        .y5_real    (q5_real),
        .y5_imag    (q5_imag),
        .y6_real    (q6_real),
        .y6_imag    (q6_imag),
        .y7_real    (q7_real),
        .y7_imag    (q7_imag)



    );

    demodem demodem1(
        .clk        (clk    ),
        .reset      (reset),
        .en         (valid_datastall),
        .x0_real    (q0_real),
        .x0_imag    (q0_imag),
        .x1_real    (q1_real),
        .x1_imag    (q1_imag),
        .x2_real    (q2_real),
        .x2_imag    (q2_imag),
        .x3_real    (q3_real),
        .x3_imag    (q3_imag),
        .x4_real    (q4_real),
        .x4_imag    (q4_imag),
        .x5_real    (q5_real),
        .x5_imag    (q5_imag),
        .x6_real    (q6_real),
        .x6_imag    (q6_imag),
        .x7_real    (q7_real),
        .x7_imag    (q7_imag),
        .out_x(demodem_outx),
        .out_y(demodem_outy),
        .sig(sig_deout)


    );

    Decoder decoder1(
        .clk        (clk    ),
        .reset      (reset),
        .en         (sig_deout),
        .in_x       (demodem_outx),
        .in_y       (demodem_outy),
        .out        (finout),
        .flag       (flag)

    );

    always@(posedge clk or negedge reset)
	 begin
		if(!reset) begin
				count<=0;
		end
		else begin
		if(count==3'd6) begin
				in<=0;
				count<=count+1;
				end
				
		else if(count==3'd7) begin
				in<=1;
				count<=0;
				end
		else count<=count+1;
				
		end
    end
    
endmodule