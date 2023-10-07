module Decoder (
    //ports
    input clk,reset,en,
    input in_x,in_y,
    output out,
    output reg flag);

    reg [7:0] temp;
    reg [3:0] result;
    reg [1:0] count;
    reg [2:0] err;
    reg re;


    initial begin
        count = 2'b0;
        temp =8'b0;

        err = 3'b0;
        // output

    end
    assign out =re;
 
    always @(posedge clk or negedge reset) begin

        if (!reset) begin
            count<=2'b0;
            temp<=8'b0;
            flag=0;
            re=0;
            result<=0;
       end
        else if (count==2'd3) begin
            count <= 2'b0;
            //temp=0;

        end
        else begin
            count <= count + 1'd1;
        end
        if (en) begin
            count<=0;
        end

        //分配寄存器
        case (count)
            2'd0: begin 
                temp[0]<=in_x; 
                temp[1]<=in_y; 
                re=result[3];
                end
            2'd1: begin 
                temp[2]<=in_x; 
                temp[3]<=in_y; 
                re=result[0];
                end
            2'd2: begin 
                temp[4]<=in_x; 
                temp[5]<=in_y; 
                re=result[1];
                end
            2'd3: begin 
                temp[6]<=in_x; 
                temp[7]<=in_y; 
                re=result[2];
                end
            
        endcase

        //
        if (count==2'd0) begin

            err [0] = temp [1] + temp[3] + temp[4] + temp[5];
            err [1] = temp [1] + temp[2] + temp[3] + temp[6];
            err [2] = temp [2] + temp[3] + temp[4] + temp[7];


            case (err)
                3'b110: temp[1] = ~temp[1];
                3'b011: temp[2] = ~temp[2];
                3'b111: temp[3] = ~temp[3];
                3'b101: temp[4] = ~temp[4];
                 default: ;
            endcase




            result[3:0] <= temp[4:1];
        end
  
    end

    



    
endmodule