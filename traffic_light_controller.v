
module traffic_light_controller (
    input clk,
    input reset,
    output reg [1:0] NS_light,
    output reg [1:0] EW_light
);
    reg [1:0] state, next_state;
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 2'b00;
        else
            state <= next_state;
    end
    always @(*) begin
        case (state)
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00;
            default: next_state = 2'b00;
        endcase
    end
    always @(*) begin
        case (state)
            2'b00: begin
                NS_light = 2'b10;
                EW_light = 2'b00;
            end
            2'b01: begin
                NS_light = 2'b01;
                EW_light = 2'b00;
            end
            2'b10: begin
                NS_light = 2'b00;
                EW_light = 2'b10;
            end
            2'b11: begin
                NS_light = 2'b00;
                EW_light = 2'b01;
            end
            default: begin
                NS_light = 2'b00;
                EW_light = 2'b00;
            end
        endcase
    end
endmodule
