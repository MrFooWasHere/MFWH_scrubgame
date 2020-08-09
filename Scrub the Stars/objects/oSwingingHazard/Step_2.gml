/// @description Move time

x = initx + sin(theta) * arm_length
y = inity + cos(theta) * arm_length

aAcc = -0.001 * sin(theta);

theta += aVel;
aVel += aAcc;

if aAcc < 1 then aAcc = 1;