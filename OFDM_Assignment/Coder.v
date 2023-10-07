module Coder (
    //ports
    input clk,reset,
    input in,
    output wire[7:0] out,
    output wire sig);

    reg [3:0] temp;
    reg [1:0] count;
    reg [2:0] err;

    initial begin
        count = 2'b00;
        temp =4'b0000;
        err = 3'b0;
        
        
    end

    assign out[0] = 1'b0;
    assign out[4:1] = temp;
    assign out[7:5] = err[2:0];
    assign sig=(count == 2'd3)? 1:0;

    always @(posedge clk or negedge reset) begin
        //count
       if (!reset) begin//reset低电位复位
           count=2'd0;
           temp=4'b0;
           err = 3'b0;
       end
        else if (count==2'd3) begin
            count   = 2'd0;
            temp    =4'b0;
            
           
        end
        else begin
            count = count + 1'd1;
        end


        //分配寄存器
        case (count)
            2'd0: temp[0]=in;
            2'd1: temp[1]=in;
            2'd2: temp[2]=in;
            2'd3: temp[3]=in;
        endcase
        
        //
        if (count==2'd3) begin
           
            
            
            err [0] <= temp [0] + temp[2] + temp[3];
            err [1] <= temp [0] + temp[1] + temp[2];
            err [2] <= temp [1] + temp[2] + temp[3];
            
            
        end



    end
    


    
endmodule