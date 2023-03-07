module HandwashSensor(

//_***Step 1a) Add a clock automation, since the sensor doesn't need to be fast, we suggest a 10 MHz clock 
    input clk,

//_***Step 1b) Add a reset automation
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



//_***Step 3a) We need to calculate the distance of the left and right hands. Calculate the distance by multiplying
//_***the left hand's distance by it's gain, and shift the result right by 7. In the example, we assume
//_***that the gain is an 8 bit fixed point number with 7 decimal places. We recommend using the Calculate
//_***automation to abstract away the multiplication.
//_***
//_***You can pass an equation to the Calculate automation. Therefore, you could pass in an equation such as
//_***leftHandDistanceHeld * leftHandGainHeld >> 7
//_***Calculate doc: https://icii.notion.site/Calculate-966443024d5d4d2db38f8db8b51f4424 (TODO: shorten url later)
wire [15:0] leftHand;

//_***Step 3b) Similary, we want to do the same for the right.
wire [15:0] rightHand;

parameter threshold = 1500;
assign waterOn = leftHand != 0 && rightHand != 0 && (leftHand < threshold || rightHand < threshold);
endmodule
