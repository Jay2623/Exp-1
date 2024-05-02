1 % Constants
2 mass = 68.1; % kg
3 g = 9.8; % m/s^2, acceleration due to gravity
4 drag_coefficient = 0.25; % kg/m
5 time_step = 0.1;
6 total_time = 12;
7
8 % Initial conditions 9 velocity = 0;
% s % s
% Initial velocity is zero as the jumper starts from rest
% Initial position is also zero
10 position = 0;
11
12 % Terminal velocity calculation
13 terminal_velocity = sqrt((mass * g) / drag_coefficient); 14
15 % Arrays to store results
16 time_values = 0:time_step:total_time;
17 velocity_values = zeros(size(time_values));
18 position_values = zeros(size(time_values));
19
20 % Euler method
21 for i = 1:length(time_values)
22 % Drag force
23     drag_force = drag_coefficient * velocity^2;
24
25 % Acceleration due to gravity and drag
26     acceleration = (mass * g - drag_force) / mass;
27
28 % Update velocity and position using Euler method
29     velocity = velocity + acceleration * time_step;
30     position = position + velocity * time_step;
31
32 % Store values in arrays
33     velocity_values(i) = velocity;
34     position_values(i) = position;
35 end
36
37 % Plotting results
38 figure;
39 subplot(2,1,1);
40 plot(time_values, velocity_values, 'b-', 'LineWidth', 1.5); 41 xlabel('Time (s)');
42 ylabel('Velocity (m/s)');
43 title('Velocity vs Time');
44
45 subplot(2,1,2);
46 plot(time_values, position_values, 'r-', 'LineWidth', 1.5); 47 xlabel('Time (s)');
48 ylabel('Position (m)');
49 title('Position vs Time');

22/4/24 4:03 PM C:\Users\chait\OneDrive\De...\Question.m 2 of 2
  50
51 % Display terminal velocity
52 disp(['Terminal Velocity: ' num2str(terminal_velocity) ' m/s']);