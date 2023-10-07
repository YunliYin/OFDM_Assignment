module Modem (
    //ports
    input wire [7:0]in,
    input clk,reset,en,
    output signed[23:0] out_x,
    output signed[23:0] out_y,
    output reg sig);

    reg signed [23:0] tempx;
    reg signed [23:0] tempy;
    reg [7:0] tempin;
    reg [1:0] count;
    
    initial begin
        tempin<=8'b0000_0000;
        tempx<=24'd0;
        tempy<=24'd0;
        count<=2'd0;
    end

    assign out_x=tempx;
    assign out_y=tempy;
    
    always @(posedge clk or negedge reset) begin

    if (!reset) begin
        tempin<=8'b0000_0000;
        tempx<=24'd0;
        tempy<=24'd0;
    end

    else if (count==2'd3) begin
        tempin=8'b0000_0000;
        tempx=24'd0;
        tempy=24'd0; 
        count=2'd0;
        
         end
    else begin
            count = count + 1'd1;
    end

    if (en) begin
        tempin=in;
        count=0;
        sig=1;
    end
    else sig=0;

    case (tempin[(2*count+1)-:2])
            2'b01: begin 
                    tempx=-24'd1;
                    tempy=-24'd1;
                    end
            2'b10: begin 
                    tempx=-24'd1;
                    tempy=24'd1;
                    end
            2'b11: begin 
                    tempx=24'd1;
                    tempy=-24'd1;
                    end
            2'b00: begin 
                    tempx=24'd1;
                    tempy=24'd1;
                    end
    endcase


    


    end




    
endmodule