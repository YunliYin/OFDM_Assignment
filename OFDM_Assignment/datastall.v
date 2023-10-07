module datastall(
    input clk,reset,en,
    input signed[23:0] in_x,
    input signed[23:0] in_y,
    output signed [23:0]      x0_real,
    output signed [23:0]      x0_imag,
    output signed [23:0]      x1_real,
    output signed [23:0]      x1_imag,
    output signed [23:0]      x2_real,
    output signed [23:0]      x2_imag,
    output signed [23:0]      x3_real,
    output signed [23:0]      x3_imag,
    output signed [23:0]      x4_real,
    output signed [23:0]      x4_imag,
    output signed [23:0]      x5_real,
    output signed [23:0]      x5_imag,
    output signed [23:0]      x6_real,
    output signed [23:0]      x6_imag,
    output signed [23:0]      x7_real,
    output signed [23:0]      x7_imag,
    output valid );
    
    reg [2:0] count;
    reg signed [23:0] x0r;
    reg signed [23:0] x1r;
    reg signed [23:0] x2r;
    reg signed [23:0] x3r;
    reg signed [23:0] x4r;
    reg signed [23:0] x5r;
    reg signed [23:0] x6r;
    reg signed [23:0] x7r;
    reg signed [23:0] x0i;
    reg signed [23:0] x1i;
    reg signed [23:0] x2i;
    reg signed [23:0] x3i;
    reg signed [23:0] x4i;
    reg signed [23:0] x5i;
    reg signed [23:0] x6i;
    reg signed [23:0] x7i;
    reg flag;
    reg [1:0] encount=0;

    assign x0_real=x0r;
    assign x1_real=x1r;
    assign x2_real=x2r;
    assign x3_real=x3r;
    assign x4_real=x4r;
    assign x5_real=x5r;
    assign x6_real=x6r;
    assign x7_real=x7r;
    assign x0_imag=x0i;
    assign x1_imag=x1i;
    assign x2_imag=x2i;
    assign x3_imag=x3i;
    assign x4_imag=x4i;
    assign x5_imag=x5i;
    assign x6_imag=x6i;
    assign x7_imag=x7i;
    assign valid=flag;


    always @(posedge clk or negedge reset) begin

    if (!reset) begin
        x0r=0;
        x1r=0;
        x2r=0;
        x3r=0;
        x4r=0;
        x5r=0;
        x6r=0;
        x7r=0;
        x0i=0;
        x1i=0;
        x2i=0;
        x3i=0;
        x4i=0;
        x5i=0;
        x6i=0;
        x7i=0;
        count=3'd0;
        flag=0;
        encount=0;
    end

    else if (count==3'd7) begin
        x0r=0;
        x1r=0;
        x2r=0;
        x3r=0;
        x4r=0;
        x5r=0;
        x6r=0;
        x7r=0;
        x0i=0;
        x1i=0;
        x2i=0;
        x3i=0;
        x4i=0;
        x5i=0;
        x6i=0;
        x7i=0; 
        count=3'd0;
        flag=0;
         end
    else begin
            count = count + 1'd1;
    end

    if(en) begin
        encount=encount +1;
        if(encount==2'd2) begin
                count=0;
                encount=0;
                
        end
    end

        case (count)
        3'd0: begin 
                
                x0r=(4096)*in_x;
                x0i=(4096)*in_y;
                end
        3'd1: begin 
                x1r=(4096)*in_x;
                x1i=(4096)*in_y;
                end
        3'd2: begin 
                x2r=(4096)*in_x;
                x2i=(4096)*in_y;
                end
        3'd3: begin 
                x3r=(4096)*in_x;
                x3i=(4096)*in_y;
                end
        3'd4: begin 
                x4r=(4096)*in_x;
                x4i=(4096)*in_y;
                end
        3'd5: begin 
                x5r=(4096)*in_x;
                x5i=(4096)*in_y;
                end
        3'd6: begin 
                x6r=(4096)*in_x;
                x6i=(4096)*in_y;
                end
        3'd7: begin 
                x7r=(4096)*in_x;
                x7i=(4096)*in_y;
                flag=1;
                end
        endcase

    end






endmodule