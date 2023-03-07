module HandwashSensor(

//_***Step 1a) Add a clock automation, since the sensor doesn't need to be fast, we suggest a 10 MHz clock 
//_***doc: https://tinyurl.com/af-clock
    input clk,

//_***Step 1b) Add a reset automation
//_***doc: https://tinyurl.com/af-reset
    input reset,

    input acceptLeftHandDistance,
    input [15:0] leftHandDistance,

    input acceptLeftHandGain,
    input [7:0] leftHandGain,

    input acceptRightHandDistance,
    input [15:0] rightHandDistance,

    input acceptRightHandGain,
    input [7:0] rightHandGain,

    output waterOn
);

//_***Step 1c) For the next 4 regs, leftHandDistanceHeld, leftHandGainHeld, rightHandDistanceHeld, and rightHandGainHeld,
//_***add a HoldWhenAccept automation with no items. We are going to make a custom automation! 
reg [15:0] leftHandDistanceHeld;
reg [7:0] leftHandGainHeld;
reg [15:0] rightHandDistanceHeld;
reg [7:0] rightHandGainHeld;

DIFFERENT FILE - //_***Continue to Step2_ModifyAutomation. Move to HoldWhenAccept.cs

endmodule
