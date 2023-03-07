# Handwash - Arctic Fox Tutorial

<p align="center">
    <img src="https://icii.io/wp-content/uploads/2022/09/New-Arctic-Fox-Logo.Blue_.For-Animation.WithBehindForGaps-1.svg" alt="Arctic Fox Logo" style="width:300px;"/>
</p>

This repo is a tutorial that implements an example handwash sensor. The sensor detects when to run water if either the left or right hand are within the appropriate distance. In this tutorial you will get an introduction to creating a custom automation and using the Calculate automation. 
<br>

# Setup
Refer to <a href="https://github.com/icii-arcticfox/TutorialHome#how-to-use-tutorials/" target="_blank">Tutorial How To</a> to start the tutorial. 

# Description
Many designs require setting internal registers, setting gain parameters, and multiplying various values. In this tutorial, we cover a simplified example of this situation.

To motivate the tutorial, we use the example of a handwash sensor that determines when to turn a sink on or off. The sensor:
1. Detects the distance a customer's hands are from the spout
2. Multiplies the distance reading by a gain
3. If the distance * gain is less than a threshold, the water is turned on

# Steps
The tutorial contains the following steps in the following files: 
- Verilog/HandwashSensor.v
  - Steps 1, 3
- Verilog/Test/HandwashSensorTest.v 
  - Step 4

<br/>

- Automations/HoldWhenAccept.cs
  - Step 2


# Solution
As you proceed through the tutorial, the correct code for previous steps will be given. 